import 'package:fit_food/features/onboarding/view/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../../../components/shared/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
        (value) => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const OnboardingScreen(),
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      body: Center(
        child: Image.asset('assets/appLogo.png'),
      ),
    );
  }
}
