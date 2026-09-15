import 'package:flutter/material.dart';

class CircularProgressWidget extends StatelessWidget {
  final double? percentage;

  const CircularProgressWidget({super.key, this.percentage});

  @override
  Widget build(BuildContext context) {
    if (percentage == null) {
      return const _ConsistencyUnavailable();
    }

    final safePercentage = percentage!.clamp(0.0, 100.0);
    final value = safePercentage / 100;

    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: CircularProgressIndicator(
                value: value,
                strokeWidth: 12,
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${safePercentage.toStringAsFixed(0)}%',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('Today', style: TextStyle(fontSize: 13)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ConsistencyUnavailable extends StatelessWidget {
  const _ConsistencyUnavailable();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
          border: Border.all(color: colorScheme.outlineVariant, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.insights_outlined, size: 34, color: colorScheme.primary),
            const SizedBox(height: 8),
            const Text(
              'No data yet',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 3),
            Text(
              'Keep going!',
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
