import 'package:fit_food/components/shared/app_text.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../components/shared/styles.dart';
import '../../../components/shared/app_colors.dart';
import '../../../components/widgets/app_button.dart';

class UpgradeView extends StatelessWidget {
  const UpgradeView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcWhiteColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            IconlyLight.arrow_left_2,
            color: kcTxtColorDark,
          ),
        ),
        elevation: 0,
        title: Text(
          'Subscription',
          style: inputText,
        ),
      ),
      backgroundColor: kcWhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ditch the Limits!',
                style: wlcmText,
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  const Icon(
                    IconlyBold.star,
                    color: kcBtnColor,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Premium features\n',
                      style: infoText,
                      children: [
                        TextSpan(
                          text:
                              'Subscribers have access to unlimited prompts, personalized meal plans, and customized options',
                          style: smallText.copyWith(
                            color: kcRedColorLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  const Icon(
                    IconlyBold.star,
                    color: kcBtnColor,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Priority Support\n',
                      style: infoText,
                      children: [
                        TextSpan(
                          text:
                              'Subscribers will be able to use fitFOOD even when the demand is high',
                          style: smallText.copyWith(
                            color: kcRedColorLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  const Icon(
                    IconlyBold.star,
                    color: kcBtnColor,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Super Fast\n',
                      style: infoText,
                      children: [
                        TextSpan(
                          text:
                              'Enjoy faster response speeds when using fitFOOD',
                          style: smallText.copyWith(
                            color: kcRedColorLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.06),
              Text(
                'Auto-renews for \$3 per month and \$20 per year',
                style: smallText,
              ),
              SizedBox(height: height * 0.01),
              AppBTN(
                title: 'SUBSCRIBE',
                onTap: () {
                  showBottomSheet(
                    context: context,
                    builder: (_) => Container(
                      color: kcWhiteColor,
                      child: const Center(
                        child: AppTXT(
                          text: 'Coming Soon',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: kcBtnColor,
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
