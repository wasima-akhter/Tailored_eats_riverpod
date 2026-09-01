import 'package:flutter/material.dart';

import '../../../app/theme/app_spacing.dart';

class AppSectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onAction;

  final Widget? leading;
  final Widget? trailing;

  const AppSectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onAction,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        if (leading != null) ...[leading!, SizedBox(width: AppSpacing.sm)],
        Expanded(child: Text(title, style: theme.textTheme.titleMedium)),
        if (trailing != null)
          trailing!
        else if (actionText != null)
          TextButton(onPressed: onAction, child: Text(actionText!)),
      ],
    );
  }
}
