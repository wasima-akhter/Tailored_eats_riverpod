import 'package:flutter/material.dart';

class ChangeGoalTypeCard extends StatelessWidget {
  const ChangeGoalTypeCard({
    super.key,
    required this.currentGoalType,
    required this.isLoading,
    required this.onChanged,
  });

  final String? currentGoalType;
  final bool isLoading;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Primary Fitness Goal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              initialValue: _isValidValue(currentGoalType)
                  ? currentGoalType
                  : null,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Goal type',
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Loose_Weight',
                  child: Text('Lose Weight'),
                ),
                DropdownMenuItem(
                  value: 'Gain_Weight',
                  child: Text('Gain Weight'),
                ),
                DropdownMenuItem(
                  value: 'Body_Recamp',
                  child: Text('Body Recomp'),
                ),
              ],
              onChanged: isLoading
                  ? null
                  : (value) {
                      if (value != null) {
                        onChanged(value);
                      }
                    },
            ),

            if (isLoading) ...[
              const SizedBox(height: 12),
              const LinearProgressIndicator(),
            ],
          ],
        ),
      ),
    );
  }

  bool _isValidValue(String? value) {
    return value == 'Loose_Weight' ||
        value == 'Gain_Weight' ||
        value == 'Body_Recamp';
  }
}
