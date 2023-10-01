import 'package:fit_food/components/widgets/app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/material.dart';

import '../../components/shared/app_colors.dart';
import '../../components/shared/styles.dart';
import '../../components/widgets/app_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  static const routeName = '/signIn';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                'Welcome Back!',
                style: wlcmText,
              ),
              Text(
                'Fill in your details to continue',
                style: hintText,
              ),
              SizedBox(height: height * 0.06),
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: kcTxtColorDark,
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.06),
              AppBTN(
                title: 'SIGN IN',
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/chats');
                },
              ),
              SizedBox(height: height * 0.04),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'New User? ',
                    style: hintText,
                    children: [
                      TextSpan(
                        text: 'Create Account',
                        style: inputText.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: kcBtnColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/signUp');
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
