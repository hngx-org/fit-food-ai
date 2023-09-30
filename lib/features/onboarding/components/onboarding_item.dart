import 'package:fit_food/components/shared/app_text.dart';
import 'package:fit_food/features/onboarding/data/models/onboarding_info_model.dart';
import 'package:flutter/material.dart';


class OnboardingItem extends StatefulWidget {
  const OnboardingItem({super.key, required this.onboardingInfo});

  final OnboardingInfoModel onboardingInfo;

  @override
  State<OnboardingItem> createState() => _OnboardingItemState();
}

class _OnboardingItemState extends State<OnboardingItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(widget.onboardingInfo.imageDir)),
        const SizedBox(
          height: 27,
        ),
        AppTXT(
          text: widget.onboardingInfo.tittle,
          fontWeight: FontWeight.w700,
          fontSize: 40,
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: AppTXT(
              textAlign: TextAlign.center,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              text: widget.onboardingInfo.subttittle),
        )
      ],
    );
  }
}
