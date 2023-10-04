import 'package:fit_food/common/viewmodels/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../../components/shared/styles.dart';
import '../../../components/shared/app_colors.dart';
import 'widgets/tilewidget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer<UserViewModel>(builder: (context, state, widget) {
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
            'Settings',
            style: inputText,
          ),
        ),
        backgroundColor: kcWhiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.032,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.03),
                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(userImage),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        state.user?.name ?? "guest",
                        style: btnText.copyWith(color: kcTxtColorDark),
                      ),
                      Text(
                        state.user?.email ?? "guest@gmail.com",
                        style: hintText,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                AppTILE(
                  leading: const Icon(
                    IconlyBold.profile,
                    color: kcBtnColor,
                  ),
                  title: Text(
                    'Edit Profile',
                    style: inputText,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/edit-profile');
                  },
                ),
                SizedBox(height: height * 0.01),
                AppTILE(
                  leading: const Icon(
                    IconlyBold.send,
                    color: kcBtnColor,
                  ),
                  title: Text(
                    'Share App',
                    style: inputText,
                  ),
                  onTap: () {},
                ),
                SizedBox(height: height * 0.01),
                AppTILE(
                  leading: const Icon(
                    IconlyBold.ticket,
                    color: kcBtnColor,
                  ),
                  title: Text(
                    'Free User',
                    style: inputText,
                  ),
                  trailing: Container(
                    height: height * 0.04,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      color: kcChatRcvdColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Upgrade Now',
                        style: nameText.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/upgradePlan');
                  },
                ),
                SizedBox(height: height * 0.01),
                AppTILE(
                  leading: const Icon(
                    IconlyBold.password,
                    color: kcBtnColor,
                  ),
                  title: Text(
                    'Logout',
                    style: inputText,
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/signIn');
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
