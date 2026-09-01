import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  /// Optional icon displayed before the text.
  final IconData? leadingIcon;

  /// Optional icon displayed after the text.
  final IconData? trailingIcon;

  /// Shows a loading indicator instead of the button content.
  final bool isLoading;

  /// Whether the button should take the available width.
  final bool fullWidth;

  /// Optional custom width.
  final double? width;

  /// Optional custom height.
  final double? height;

  /// Optional custom background color.
  final Color? backgroundColor;

  /// Optional custom foreground color.
  final Color? foregroundColor;

  /// Optional custom border color.
  final Color? borderColor;

  /// Optional custom border radius.
  final double? borderRadius;

  /// Optional custom text style.
  final TextStyle? textStyle;

  /// Optional elevation.
  final double? elevation;

  /// Controls internal horizontal padding.
  final double? horizontalPadding;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.fullWidth = true,
    this.width,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderRadius,
    this.textStyle,
    this.elevation,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final buttonHeight = height ?? 48.h;
    final radius = borderRadius ?? 12.r;

    final buttonStyle = ElevatedButton.styleFrom(
      minimumSize: Size(fullWidth ? double.infinity : 0, buttonHeight),
      fixedSize: width != null ? Size(width!, buttonHeight) : null,
      padding: EdgeInsets.symmetric(horizontal: (horizontalPadding ?? 16).w),
      backgroundColor: backgroundColor ?? theme.colorScheme.primary,
      foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
      disabledBackgroundColor: theme.colorScheme.onSurface.withValues(
        alpha: 0.12,
      ),
      disabledForegroundColor: theme.colorScheme.onSurface.withValues(
        alpha: 0.38,
      ),
      elevation: elevation ?? 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: borderColor != null
            ? BorderSide(color: borderColor!)
            : BorderSide.none,
      ),
    );

    final buttonChild = isLoading
        ? SizedBox(
            width: 20.w,
            height: 20.w,
            child: CircularProgressIndicator(
              strokeWidth: 2.w,
              color: foregroundColor ?? theme.colorScheme.onPrimary,
            ),
          )
        : _ButtonContent(
            text: text,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            textStyle:
                textStyle ??
                theme.textTheme.labelLarge?.copyWith(
                  color: foregroundColor ?? theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
          );

    return SizedBox(
      width: fullWidth ? double.infinity : width,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: buttonStyle,
        child: buttonChild,
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  final String text;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final TextStyle? textStyle;

  const _ButtonContent({
    required this.text,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leadingIcon != null) ...[
          Icon(leadingIcon, size: 20.sp),
          SizedBox(width: 8.w),
        ],
        Flexible(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
          ),
        ),
        if (trailingIcon != null) ...[
          SizedBox(width: 8.w),
          Icon(trailingIcon, size: 20.sp),
        ],
      ],
    );
  }
}
