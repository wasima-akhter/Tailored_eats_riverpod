import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const OnboardingIndicator({
    super.key,
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(itemCount, (index) {
        final isActive = index == currentIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: isActive ? 24.w : 8.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: isActive ? colorScheme.primary : colorScheme.outlineVariant,
            borderRadius: BorderRadius.circular(20.r),
          ),
        );
      }),
    );
  }
}
