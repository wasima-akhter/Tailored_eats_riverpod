import 'package:flutter/material.dart';

import '../../../../../core/widgets/buttons/app_button.dart';
import '../../../../../core/widgets/buttons/app_text_button.dart';

class OnboardingButton extends StatelessWidget {
  final bool isLastPage;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final VoidCallback onGetStarted;

  const OnboardingButton({
    super.key,
    required this.isLastPage,
    required this.onNext,
    required this.onSkip,
    required this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          text: isLastPage ? 'Get Started' : 'Next',
          onPressed: isLastPage ? onGetStarted : onNext,
        ),
        if (!isLastPage) AppTextButton(text: 'Skip', onPressed: onSkip),
      ],
    );
  }
}
