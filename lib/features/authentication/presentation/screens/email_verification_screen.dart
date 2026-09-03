import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/email_verification_controller.dart';
import '../controllers/email_verification_state.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  final String email;

  const EmailVerificationScreen({super.key, required this.email});

  @override
  ConsumerState<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _otpController;

  @override
  void initState() {
    super.initState();

    _otpController = TextEditingController();
  }

  @override
  void dispose() {
    _otpController.dispose();

    super.dispose();
  }

  Future<void> _sendOtp() async {
    await ref
        .read(emailVerificationControllerProvider.notifier)
        .sendOtp(email: widget.email);
  }

  Future<void> _verifyOtp() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    await ref
        .read(emailVerificationControllerProvider.notifier)
        .verifyOtp(email: widget.email, otp: _otpController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<EmailVerificationState>(emailVerificationControllerProvider, (
      previous,
      next,
    ) {
      if (!mounted) {
        return;
      }

      if (next.status == EmailVerificationStatus.error &&
          next.errorMessage != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }

      if (next.status == EmailVerificationStatus.otpSent) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Verification code sent to your email.'),
          ),
        );
      }

      if (next.status == EmailVerificationStatus.verified) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email verified successfully.')),
        );

        // Navigation will be handled later by GoRouter.
      }
    });

    final state = ref.watch(emailVerificationControllerProvider);

    final isSendingOtp = state.status == EmailVerificationStatus.sendingOtp;

    final isVerifyingOtp = state.status == EmailVerificationStatus.verifyingOtp;

    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40.h),

                Icon(Icons.mark_email_unread_outlined, size: 64.w),

                SizedBox(height: 24.h),

                Text(
                  'Verify Your Email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 12.h),

                Text(
                  'We sent a verification code to',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  widget.email,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 32.h),

                TextFormField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 8.w,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Verification Code',
                    hintText: '000000',
                    counterText: '',
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateOtp,
                  onFieldSubmitted: (_) {
                    if (!state.isLoading) {
                      _verifyOtp();
                    }
                  },
                ),

                SizedBox(height: 24.h),

                SizedBox(
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: state.isLoading ? null : _verifyOtp,
                    child: isVerifyingOtp
                        ? SizedBox(
                            height: 22.w,
                            width: 22.w,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : const Text('Verify Email'),
                  ),
                ),

                SizedBox(height: 16.h),

                TextButton(
                  onPressed: state.isLoading ? null : _sendOtp,
                  child: isSendingOtp
                      ? SizedBox(
                          height: 20.w,
                          width: 20.w,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : const Text('Resend Code'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validateOtp(String? value) {
    final otp = value?.trim() ?? '';

    if (otp.isEmpty) {
      return 'Verification code is required';
    }

    if (otp.length != 6) {
      return 'Enter the 6-digit verification code';
    }

    if (!RegExp(r'^\d{6}$').hasMatch(otp)) {
      return 'Verification code must contain only numbers';
    }

    return null;
  }
}
