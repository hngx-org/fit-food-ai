import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../components/shared/styles.dart';
import '../../../components/shared/app_colors.dart';
import '../../../components/widgets/app_button.dart';
import '../../../components/widgets/app_text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  static const routeName = '/edit-profile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool _visibility = true;

  bool _passwordVisible = true;

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
          'Profile',
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.02),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(userImage),
                  ),
                  Positioned(
                    left: width * 0.23,
                    top: height * 0.09,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 35,
                        decoration: const BoxDecoration(
                            color: kcBtnColor, shape: BoxShape.circle),
                        child: const Icon(
                          IconlyLight.edit,
                          color: kcWhiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 0.02),
              Text(
                'Victor Benita D.',
                style: btnText.copyWith(color: kcTxtColorDark),
              ),
              SizedBox(height: height * 0.03),
              AppTXTField(
                hint: 'Victor Benita D.',
                leading: const Icon(
                  IconlyLight.profile,
                  color: kcChatRcvdColor,
                ),
              ),
              SizedBox(height: height * 0.035),
              AppTXTField(
                hint: 'victorbenita3421@hngx.org',
                leading: const Icon(
                  IconlyLight.message,
                  color: kcChatRcvdColor,
                ),
              ),
              SizedBox(height: height * 0.035),
              AppTXTField(
                hint: '****************',
                obscure: _passwordVisible,
                leading: const Icon(
                  IconlyLight.lock,
                  color: kcChatRcvdColor,
                ),
                trailing: GestureDetector(
                  onTap: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  child: Icon(
                    _passwordVisible ? IconlyLight.hide : IconlyLight.show,
                    color: kcChatRcvdColor,
                  ),
                ),
              ),
              SizedBox(height: height * 0.035),
              AppTXTField(
                hint: '****************',
                obscure: _visibility,
                leading: const Icon(
                  IconlyLight.lock,
                  color: kcChatRcvdColor,
                ),
                trailing: GestureDetector(
                  onTap: () {
                    setState(() {
                      _visibility = !_visibility;
                    });
                  },
                  child: Icon(
                    _visibility ? IconlyLight.hide : IconlyLight.show,
                    color: kcChatRcvdColor,
                  ),
                ),
              ),
              SizedBox(height: height * 0.06),
              AppBTN(
                title: 'SAVE NOW',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
