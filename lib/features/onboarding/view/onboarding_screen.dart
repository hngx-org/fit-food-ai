import 'package:fit_food/components/shared/app_colors.dart';
import 'package:fit_food/components/shared/styles.dart';
import 'package:fit_food/components/widgets/app_button.dart';
import 'package:fit_food/features/onboarding/components/onboarding_indicator.dart';
import 'package:fit_food/features/onboarding/components/onboarding_item.dart';
import 'package:fit_food/features/onboarding/data/models/onboarding_info_model.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  var _currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      _currentPage = _pageController.page?.round() ?? 0;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    style:
                        TextButton.styleFrom(foregroundColor: kcTxtColorDark),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signIn');
                    },
                    child: Text(
                      'SKIP',
                      style:
                          btnText.copyWith(color: kcTxtColorDark, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: OnboardingInfoModel.defaultInfo.length,
                    itemBuilder: (context, index) => OnboardingItem(
                        onboardingInfo: OnboardingInfoModel.defaultInfo[index]),
                  )),
              SizedBox(
                height: height * 0.018,
              ),
              Center(
                  child: OnboardingIndicator(
                      itemCount: OnboardingInfoModel.defaultInfo.length,
                      currentIndex: _currentPage)),
              Expanded(
                flex: 2,
                child: Center(
                  child: AnimatedCrossFade(
                      firstChild: const SizedBox(),
                      secondChild: AppBTN(
                        title: 'CONTINUE',
                        onTap: () {

                          Navigator.pushReplacementNamed(context, '/signIn');
                        },
                      ),
                      crossFadeState: _currentPage + 1 ==
                              OnboardingInfoModel.defaultInfo.length
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      secondCurve: Curves.easeIn,
                      duration: const Duration(milliseconds: 300)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
