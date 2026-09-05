import 'package:flutter/material.dart';

class GoalLoading extends StatelessWidget {
  const GoalLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
