import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: false,
    );
  }
}
