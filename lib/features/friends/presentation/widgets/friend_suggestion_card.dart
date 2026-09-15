import 'package:flutter/material.dart';

import '../../domain/entities/friend_suggestion.dart';

class FriendSuggestionCard extends StatelessWidget {
  const FriendSuggestionCard({
    super.key,
    required this.suggestion,
    required this.onAdd,
    this.isLoading = false,
    this.onTap,
  });

  final FriendSuggestion suggestion;
  final VoidCallback onAdd;
  final bool isLoading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final name = suggestion.name.trim().isNotEmpty
        ? suggestion.name.trim()
        : 'Unknown user';

    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: colors.surface,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: colors.outline.withValues(alpha: 0.18)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        splashColor: colors.primary.withValues(alpha: 0.06),
        highlightColor: colors.primary.withValues(alpha: 0.03),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAvatar(theme, initial),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 5),
                        _buildBasicInfo(theme),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildAddButton(theme),
                ],
              ),
              const SizedBox(height: 14),
              _buildDivider(theme),
              const SizedBox(height: 12),
              _buildProfileInfo(theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(ThemeData theme, String initial) {
    final colors = theme.colorScheme;
    final imageUrl = suggestion.image.trim();

    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors.primaryContainer,
        border: Border.all(
          color: colors.primary.withValues(alpha: 0.15),
          width: 1.5,
        ),
      ),
      child: ClipOval(
        child: imageUrl.isNotEmpty
            ? Image.network(
                imageUrl,
                width: 58,
                height: 58,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) {
                  return _buildInitialAvatar(theme, initial);
                },
              )
            : _buildInitialAvatar(theme, initial),
      ),
    );
  }

  Widget _buildInitialAvatar(ThemeData theme, String initial) {
    final colors = theme.colorScheme;

    return Center(
      child: Text(
        initial,
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w800,
          color: colors.onPrimaryContainer,
        ),
      ),
    );
  }

  Widget _buildBasicInfo(ThemeData theme) {
    final colors = theme.colorScheme;
    final items = <String>[];

    if (suggestion.age != null && suggestion.age! > 0) {
      items.add('${suggestion.age} yrs');
    }

    if (suggestion.gender.trim().isNotEmpty) {
      items.add(_formatValue(suggestion.gender));
    }

    if (suggestion.height != null && suggestion.height! > 0) {
      items.add('${_formatNumber(suggestion.height!)} cm');
    }

    if (items.isEmpty) {
      return Text(
        'Profile details unavailable',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: colors.onSurfaceVariant,
        ),
      );
    }

    return Text(
      items.join('  •  '),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: colors.onSurfaceVariant,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildAddButton(ThemeData theme) {
    final colors = theme.colorScheme;

    return SizedBox(
      width: 78,
      height: 38,
      child: ElevatedButton(
        onPressed: isLoading ? null : onAdd,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          disabledBackgroundColor: colors.surfaceContainerHighest,
          disabledForegroundColor: colors.onSurfaceVariant,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 17,
                height: 17,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: colors.onSurfaceVariant,
                ),
              )
            : const Text('Add', style: TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }

  Widget _buildDivider(ThemeData theme) {
    final colors = theme.colorScheme;

    return Divider(
      height: 1,
      thickness: 1,
      color: colors.outlineVariant.withValues(alpha: 0.45),
    );
  }

  Widget _buildProfileInfo(ThemeData theme) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        if (suggestion.mainGoal.trim().isNotEmpty)
          _InfoChip(icon: Icons.flag_outlined, label: suggestion.mainGoal),
        if (suggestion.activityLevel.trim().isNotEmpty)
          _InfoChip(
            icon: Icons.directions_run_rounded,
            label: suggestion.activityLevel,
          ),
        if (suggestion.foodVibe.trim().isNotEmpty)
          _InfoChip(
            icon: Icons.restaurant_outlined,
            label: suggestion.foodVibe,
          ),
        if (suggestion.training.trim().isNotEmpty)
          _InfoChip(
            icon: Icons.fitness_center_outlined,
            label: suggestion.training,
          ),
      ],
    );
  }

  String _formatValue(String value) {
    final trimmed = value.trim();

    if (trimmed.isEmpty) {
      return '';
    }

    return trimmed
        .split(RegExp(r'[\s_-]+'))
        .where((word) => word.isNotEmpty)
        .map(
          (word) =>
              '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(' ');
  }

  String _formatNumber(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }

    return value.toStringAsFixed(1);
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      constraints: const BoxConstraints(maxWidth: 180),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.primary.withValues(alpha: 0.08)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: colors.primary),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              _formatLabel(label),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatLabel(String value) {
    final trimmed = value.trim();

    if (trimmed.isEmpty) {
      return '';
    }

    return trimmed
        .split(RegExp(r'[\s_-]+'))
        .where((word) => word.isNotEmpty)
        .map(
          (word) =>
              '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(' ');
  }
}
