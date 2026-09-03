import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/theme/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(splashControllerProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SplashState>(splashControllerProvider, (previous, next) {
      final route = next.nextRoute;

      if (route == null || !mounted) {
        return;
      }

      context.go(route);
    });

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: const Center(child: _SplashContent()),
    );
  }
}

class _SplashContent extends StatelessWidget {
  const _SplashContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // TODO: Replace with the actual app logo.
        Text(
          'Tailored Eats',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
