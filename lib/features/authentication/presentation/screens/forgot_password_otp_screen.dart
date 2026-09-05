import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_paths.dart';
import '../controllers/forgot_password_controller.dart';
import '../controllers/forgot_password_state.dart';

class ForgotPasswordOtpScreen extends ConsumerStatefulWidget {
  final String email;

  const ForgotPasswordOtpScreen({super.key, required this.email});

  @override
  ConsumerState<ForgotPasswordOtpScreen> createState() =>
      _ForgotPasswordOtpScreenState();
}

class _ForgotPasswordOtpScreenState
    extends ConsumerState<ForgotPasswordOtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();

    ref
        .read(forgotPasswordControllerProvider.notifier)
        .verifyOtp(email: widget.email, otp: _otpController.text.trim());
  }

  void _resendOtp() {
    ref
        .read(forgotPasswordControllerProvider.notifier)
        .requestOtp(email: widget.email);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ForgotPasswordState>(forgotPasswordControllerProvider, (
      previous,
      next,
    ) {
      if (next.status == ForgotPasswordStatus.error &&
          next.errorMessage != null) {
        // ScaffoldMessenger.of(
        //   context,
        // ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));

        debugPrint(next.errorMessage!);
        ref.read(forgotPasswordControllerProvider.notifier).clearError();
      }

      if (next.status == ForgotPasswordStatus.otpVerified &&
          next.activationToken != null) {
        debugPrint('OTP VERIFIED');
        debugPrint('EMAIL: ${widget.email}');
        debugPrint('TOKEN RECEIVED: ${next.activationToken!.isNotEmpty}');

        context.goNamed(
          AppRoutes.resetPassword,
          extra: {
            'email': widget.email,
            'activationToken': next.activationToken,
          },
        );
      }

      if (next.status == ForgotPasswordStatus.otpSent) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('A new verification code has been sent.'),
          ),
        );
      }
    });

    final state = ref.watch(forgotPasswordControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Verify Code')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),

                Text(
                  'Enter verification code',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 12.h),

                Text(
                  'We sent a verification code to ${widget.email}.',
                  style: TextStyle(fontSize: 15.sp),
                ),

                SizedBox(height: 32.h),

                Text(
                  'Verification Code',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 8.h),

                TextFormField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  enabled: !state.isLoading,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: 'Enter 4-digit code',
                    border: OutlineInputBorder(),
                    counterText: '',
                  ),
                  onFieldSubmitted: (_) => _submit(),
                  validator: (value) {
                    final otp = value?.trim() ?? '';

                    if (otp.isEmpty) {
                      return 'Please enter the verification code.';
                    }

                    if (otp.length != 4) {
                      return 'Verification code must be 4 digits.';
                    }

                    if (!RegExp(r'^\d{4}$').hasMatch(otp)) {
                      return 'Please enter a valid verification code.';
                    }

                    return null;
                  },
                ),

                SizedBox(height: 24.h),

                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: state.isLoading ? null : _submit,
                    child: state.isLoading
                        ? SizedBox(
                            width: 22.w,
                            height: 22.w,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Verify Code',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),

                SizedBox(height: 16.h),

                Center(
                  child: TextButton(
                    onPressed: state.isLoading ? null : _resendOtp,
                    child: const Text('Resend Code'),
                  ),
                ),

                SizedBox(height: 8.h),

                Center(
                  child: TextButton(
                    onPressed: state.isLoading
                        ? null
                        : () {
                            context.goNamed(AppRoutes.forgotPassword);
                          },
                    child: const Text('Change Email'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
