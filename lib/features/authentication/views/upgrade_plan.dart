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
  String _selectedPlan = '';

  void checkedPlan(String value) {
    setState(() {
      _selectedPlan = value;
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
    var amount = _selectedPlan.substring(
      0,
      _selectedPlan.indexOf(' '),
    );

    final planUpgrade = HNGPay();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/settings');
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
                height: height * 0.2,
                width: width,
                decoration: BoxDecoration(
                  color: kcChatRcvdColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: 2, // Two options: Monthly and Yearly
                  itemBuilder: (context, index) {
                    final planName =
                        index == 0 ? 'Monthly Plan' : 'Yearly Plan';
                    final planCost =
                        index == 0 ? '\$3 monthly' : '\$30 anually';

                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: index,
                                groupValue: _selectedPlan,
                                onChanged: (value) {
                                  checkedPlan(value as String);
                                },
                              ),
                              Text(
                                planName,
                                style: infoText,
                              ),
                            ],
                          ),
                          Text(
                            planCost,
                            style: smallText.copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * 0.035,
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: height * 0.065,
                  decoration: BoxDecoration(
                    color: kcBtnColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: planUpgrade.applePay(
                    amountToPay: amount,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
