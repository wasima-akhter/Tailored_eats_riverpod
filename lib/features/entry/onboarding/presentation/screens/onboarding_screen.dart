import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tailored_eats_riverpod/core/assets/assets.gen.dart';

import '../../../../../app/router/route_paths.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/onboarding_indicator.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late final PageController _pageController;

  int _currentPage = 0;

  static final List<OnboardingData> _pages = [
    OnboardingData(
      image: Assets.images.onboarding.onboard1.path,
      title: 'Discover delicious meals',
      description: 'Find meals that match your preferences and goals.',
    ),
    OnboardingData(
      image: Assets.images.onboarding.onboard2.path,
      title: 'Track your progress',
      description: 'Keep track of your meals and progress in one place.',
    ),
    OnboardingData(
      image: Assets.images.onboarding.onboard3.path,
      title: 'Enjoy your journey',
      description: 'Build better eating habits with a simple experience.',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool get _isLastPage => _currentPage == _pages.length - 1;

  void _nextPage() {
    if (_isLastPage) return;

    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _skip() {
    _pageController.animateToPage(
      _pages.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _completeOnboarding() async {
    await ref.read(onboardingProvider.notifier).completeOnboarding();

    if (!mounted) return;

    context.pushReplacementNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final page = _pages[index];

                    return OnboardingPage(
                      image: page.image,
                      title: page.title,
                      description: page.description,
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),
              OnboardingIndicator(
                currentIndex: _currentPage,
                itemCount: _pages.length,
              ),
              SizedBox(height: 24.h),
              OnboardingButton(
                isLastPage: _isLastPage,
                onNext: _nextPage,
                onSkip: _skip,
                onGetStarted: _completeOnboarding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingData {
  final String image;
  final String title;
  final String description;

  const OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}
