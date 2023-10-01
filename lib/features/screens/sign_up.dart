import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../components/shared/app_colors.dart';
import '../../components/shared/styles.dart';
import '../../components/widgets/app_button.dart';
import '../../components/widgets/app_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static const routeName = '/signUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _passwordVisible = true;
  bool _visibility = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            IconlyLight.arrow_left_2,
            color: kcTxtColorDark,
          ),
        ),
        backgroundColor: kcWhiteColor,
        elevation: 0,
      ),
      backgroundColor: kcWhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),
              Text(
                'Register Account',
                style: wlcmText,
              ),
              Text(
                'Fill in your details to continue',
                style: hintText,
              ),
              SizedBox(height: height * 0.06),
              AppTXTField(
                hint: 'Username',
                leading: const Icon(
                  IconlyLight.profile,
                  color: kcChatRcvdColor,
                ),
              ),
              SizedBox(height: height * 0.035),
              AppTXTField(
                hint: 'Email address',
                leading: const Icon(
                  IconlyLight.message,
                  color: kcChatRcvdColor,
                ),
              ),
              SizedBox(height: height * 0.035),
              AppTXTField(
                hint: 'Password',
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
                    _passwordVisible ? IconlyLight.show : IconlyLight.hide,
                    color: kcChatRcvdColor,
                  ),
                ),
              ),
              SizedBox(height: height * 0.035),
              AppTXTField(
                hint: 'Confirm Password',
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
                    _visibility ? IconlyLight.show : IconlyLight.hide,
                    color: kcChatRcvdColor,
                  ),
                ),
              ),
              SizedBox(height: height * 0.06),
              AppBTN(
                title: 'SIGN UP',
                onTap: () {},
              ),
              SizedBox(height: height * 0.04),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Already Registered? ',
                    style: hintText,
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: inputText.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: kcBtnColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(context, '/signIn');
                          },
                      ),
                    ],
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
