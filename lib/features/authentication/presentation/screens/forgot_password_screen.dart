import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_paths.dart';
import '../controllers/forgot_password_controller.dart';
import '../controllers/forgot_password_state.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();

    ref
        .read(forgotPasswordControllerProvider.notifier)
        .requestOtp(email: _emailController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ForgotPasswordState>(forgotPasswordControllerProvider, (
      previous,
      next,
    ) {
      if (next.status == ForgotPasswordStatus.error &&
          next.errorMessage != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));

        ref.read(forgotPasswordControllerProvider.notifier).clearError();
      }

      if (next.status == ForgotPasswordStatus.otpSent) {
        context.goNamed(AppRoutes.forgotPasswordOtp, extra: next.email);
      }
    });

    final state = ref.watch(forgotPasswordControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
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
                  'Forgot your password?',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 12.h),

                Text(
                  'Enter your email address and we will send you '
                  'a verification code to reset your password.',
                  style: TextStyle(fontSize: 15.sp),
                ),

                SizedBox(height: 32.h),

                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 8.h),

                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  enabled: !state.isLoading,
                  autofillHints: const [AutofillHints.email],
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                  ),
                  onFieldSubmitted: (_) => _submit(),
                  validator: (value) {
                    final email = value?.trim() ?? '';

                    if (email.isEmpty) {
                      return 'Please enter your email.';
                    }

                    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

                    if (!emailRegex.hasMatch(email)) {
                      return 'Please enter a valid email.';
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
                            'Send Code',
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
                    onPressed: state.isLoading
                        ? null
                        : () {
                            context.goNamed(AppRoutes.login);
                          },
                    child: const Text('Back to Login'),
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
