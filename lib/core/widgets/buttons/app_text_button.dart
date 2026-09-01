import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  /// Optional icon displayed before the text.
  final IconData? leadingIcon;

  /// Optional icon displayed after the text.
  final IconData? trailingIcon;

  /// Optional custom text color.
  final Color? foregroundColor;

  /// Optional custom text style.
  final TextStyle? textStyle;

  /// Optional custom icon size.
  final double? iconSize;

  /// Optional custom horizontal padding.
  final double? horizontalPadding;

  /// Optional custom vertical padding.
  final double? verticalPadding;

  const AppTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.foregroundColor,
    this.textStyle,
    this.iconSize,
    this.horizontalPadding,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final effectiveColor = foregroundColor ?? theme.colorScheme.primary;

    final effectiveTextStyle =
        textStyle ??
        theme.textTheme.labelLarge?.copyWith(
          color: effectiveColor,
          fontWeight: FontWeight.w600,
        );

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: effectiveColor,
        padding: EdgeInsets.symmetric(
          horizontal: (horizontalPadding ?? 8).w,
          vertical: (verticalPadding ?? 6).h,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, size: (iconSize ?? 18).sp, color: effectiveColor),
            SizedBox(width: 6.w),
          ],
          Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: effectiveTextStyle,
            ),
          ),
          if (trailingIcon != null) ...[
            SizedBox(width: 6.w),
            Icon(
              trailingIcon,
              size: (iconSize ?? 18).sp,
              color: effectiveColor,
            ),
          ],
        ],
      ),
    );
  }
}
