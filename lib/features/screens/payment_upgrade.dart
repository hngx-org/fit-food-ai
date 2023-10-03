import 'package:fit_food/Routes/routes.dart';
import 'package:fit_food/components/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../components/shared/app_colors.dart';


class UpgradePlan extends StatefulWidget {
  const UpgradePlan({super.key});

  static const routeName = '/upgrade';

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

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
       leading: IconButton(
          onPressed: () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(settingsRoute, (route) => false);
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
            Center(
              child: Text('Ditch the limits!',
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
                  borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                        itemCount: yourItemList.length, // Replace with your actual list
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.check),
                            title: Text(yourItemList[index]), // Replace with your data
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('Select Plan',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: 180,
              width: 300,
                decoration: BoxDecoration(
                  color: kcChatRcvdColor,
                  borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                ),
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ListView.builder(
                  itemCount: 2, // Two options: Monthly and Yearly
                  itemBuilder: (context, index) {
                    final planName = index == 0 ? 'Monthly Plan' : 'Yearly Plan';
                    final planCost = index == 0 ? '\$3/month' : '\$20/year';

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
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: kcTxtColorDark,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            planCost,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
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
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(onPressed: () {},

                  child: Text('Upgrade Now',
                  style: TextStyle(
                    color: kcWhiteColor,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(kcBtnColor), // Set the button color
                  minimumSize: MaterialStateProperty.all<Size>(Size(250, 48)), // Set the button width and height
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Set the border radius
                    ),
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

