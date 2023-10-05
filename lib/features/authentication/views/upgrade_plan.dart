import 'package:fit_food/components/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:in_app_payment/in_app_payment.dart';

import '../../../components/shared/app_colors.dart';

class UpgradePlan extends StatefulWidget {
  const UpgradePlan({super.key});

  static const routeName = '/upgradePlan';

  @override
  State<UpgradePlan> createState() => _UpgradePlanState();
}

class _UpgradePlanState extends State<UpgradePlan> {
  String selectedPlan = '';

  void picked(String value) {
    setState(() {
      selectedPlan = value;
    });
  }

  List<String> yourItemList = [
    "Unlimited prompts",
    "Personalized Meal Plans",
    "Priority Support",
    "Customization Options"
  ];

  @override
  Widget build(BuildContext context) {
    final planUpgrade = HNGPay();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconlyLight.arrow_left_2,
            color: kcTxtColorDark,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Upgrade Plan',
          style: inputText,
        ),
      ),
      backgroundColor: kcWhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ditch the limit!',
                style: btnText.copyWith(
                  fontSize: 25,
                  color: kcTxtColorDark,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                height: height * 0.35,
                width: width,
                decoration: BoxDecoration(
                  color: kcChatRcvdColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fit-Food Pro",
                      style: nameText,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: yourItemList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(
                              Icons.check,
                              color: kcTxtColorDark,
                            ),
                            title: Text(yourItemList[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                'Select Plan',
                style: nameText,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.23,
                width: width,
                decoration: BoxDecoration(
                  color: kcChatRcvdColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Monthly Plan',
                        style: infoText,
                      ),
                      subtitle: Text(
                        '\$3 monthly',
                        style: smallText.copyWith(
                          fontSize: 13,
                        ),
                      ),
                      leading: Radio(
                        value: '3',
                        groupValue: selectedPlan,
                        onChanged: (value) {
                          picked(value as String);
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Yearly Plan',
                        style: infoText,
                      ),
                      subtitle: Text(
                        '\$30 annually',
                        style: smallText.copyWith(
                          fontSize: 13,
                        ),
                      ),
                      leading: Radio(
                        value: '30',
                        groupValue: selectedPlan,
                        onChanged: (value) {
                          picked(value as String);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.035,
              ),
              Container(
                width: width,
                height: height * 0.065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: planUpgrade.applePay(
                  amountToPay: selectedPlan,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
