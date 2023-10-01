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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(child: Image.asset(widget.onboardingInfo.imageDir)),
        SizedBox(
          height: height * 0.027,
        ),
        AppTXT(
          text: widget.onboardingInfo.tittle,
          fontWeight: FontWeight.w700,
          fontSize: 40,
        ),
        SizedBox(
          height: height * 0.008,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.016),
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
