import 'package:fit_food/components/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../components/shared/app_colors.dart';

class UpgradePlan extends StatefulWidget {
  const UpgradePlan({super.key});

  static const routeName = '/upgradePlan';

  @override
  State<UpgradePlan> createState() => _UpgradePlanState();
}

class _UpgradePlanState extends State<UpgradePlan> {
  int? _selectedPlanIndex;

  List<String> yourItemList = [
    "Unlimited prompts",
    "Personalized Meal Plans",
    "Priority Support",
    "Customization Options"
  ];

  @override
  Widget build(BuildContext context) {
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
        title: Text('Fit-Food Pro',
          style: wlcmText,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text('Ditch the limit!',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: kcChatRcvdColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Fit-Food Pro",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: kcTxtColorDark,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: yourItemList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.check),
                            title: Text(yourItemList[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('Select Plan',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  fontSize: 17,
                ),
              ),
            ),
            Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  color: kcChatRcvdColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView.builder(
                  itemCount: 2, // Two options: Monthly and Yearly
                  itemBuilder: (context, index) {
                    final planName = index == 0 ? 'Monthly Plan' : 'Yearly Plan';
                    final planCost = index == 0 ? '\$3 monthly' : '\$30 anually';

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: index,
                                groupValue: _selectedPlanIndex,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedPlanIndex = value;
                                  });
                                },
                              ),
                              Text(
                                planName,
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: kcTxtColorDark,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            planCost,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: kcTxtColorDark,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(kcBtnColor),
                  minimumSize: MaterialStateProperty.all<Size>(Size(300, 48)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text('Upgrade Now',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: kcWhiteColor,
                ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}