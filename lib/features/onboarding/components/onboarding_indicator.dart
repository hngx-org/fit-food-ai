import 'package:fit_food/components/shared/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingIndicator extends StatefulWidget {
  const OnboardingIndicator(
      {super.key, required this.itemCount, required this.currentIndex});

  final int itemCount;
  final int currentIndex;

  @override
  State<OnboardingIndicator> createState() => _OnboardingIndicatorState();
}

class _OnboardingIndicatorState extends State<OnboardingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
          widget.itemCount,
          (index) => AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                duration: const Duration(milliseconds: 300),
                height: 8,
                width: widget.currentIndex == index ? 16 : 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: widget.currentIndex == index
                        ? kcBtnColor
                        : kcBtnColor.withOpacity(0.2)),
              )),
    );
  }
}
