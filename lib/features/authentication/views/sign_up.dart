import 'package:fit_food/components/shared/app_colors.dart';
import 'package:fit_food/components/shared/styles.dart';
import 'package:fit_food/components/widgets/app_button.dart';
import 'package:fit_food/components/widgets/app_text_field.dart';
import 'package:fit_food/core/helpers/validators.dart';
import 'package:fit_food/features/authentication/viewmodel/auth_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static const routeName = '/signUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _passwordVisible = true;
  bool _visibility = true;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
          child: Form(
            key: _formKey,
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
                  controller: _nameController,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Enter Username"),
                    MinLengthValidator(6,
                        errorText: "Username should be up to 6 character"),
                  ]),
                  leading: const Icon(
                    IconlyLight.profile,
                    color: kcChatRcvdColor,
                  ),
                ),
                SizedBox(height: height * 0.035),
                AppTXTField(
                  hint: 'Email address',
                  controller: _emailController,
                  validator: MultiValidator([
                    EmailValidator(errorText: "Invalid Email"),
                    RequiredValidator(errorText: "Enter Email"),
                  ]),
                  leading: const Icon(
                    IconlyLight.message,
                    color: kcChatRcvdColor,
                  ),
                ),
                SizedBox(height: height * 0.035),
                AppTXTField(
                  hint: 'Password',
                  obscure: _passwordVisible,
                  controller: _passwordController,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Enter Password"),
                    MinLengthValidator(8,
                        errorText: "Password should be up to 8s character"),
                  ]),
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
                  controller: _confirmPasswordController,
                  obscure: _visibility,
                  onChanged: (val) => setState(() {}),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Enter Password"),
                    MinLengthValidator(8,
                        errorText: "Password should be up to 8 character"),
                    ConfirmPasswordValidator(
                        errorText: 'Password mismatch',
                        comparedPassword: _passwordController.text)
                  ]),
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
                  onTap: () {
                    _signUpUser(context);
                  },
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
                              Navigator.pushReplacementNamed(
                                  context, '/signIn');
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
      ),
    );
  }

  void _signUpUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      var viewModel = Provider.of<AuthViewModel>(context, listen: false);
      viewModel.signUpUser(
          email: _emailController.text,
          password: _passwordController.text,
          name: _nameController.text);
    }
  }
}
