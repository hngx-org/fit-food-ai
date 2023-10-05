import 'package:fit_food/common/base/base_view_model.dart';
import 'package:fit_food/components/widgets/app_button.dart';
import 'package:fit_food/features/authentication/models/auth_state.dart';
import 'package:fit_food/features/authentication/viewmodel/auth_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/shared/app_colors.dart';
import '../../../components/shared/styles.dart';
import '../../../components/widgets/app_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  static const routeName = '/signIn';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _passwordVisible = true;
  final auth = Authentication();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ViewModelProviderValue(
      value: context.read<AuthViewModel>(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                    controller: _emailController,
                    leading: const Icon(
                      IconlyLight.message,
                      color: kcChatRcvdColor,
                    ),
                    validator: MultiValidator([
                      EmailValidator(errorText: "Invalid Email"),
                      RequiredValidator(errorText: "Enter Email"),
                    ]),
                  ),
                  SizedBox(height: height * 0.035),
                  AppTXTField(
                    hint: 'Password',
                    obscure: _passwordVisible,
                    controller: _passwordController,
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
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Enter Password"),
                      MinLengthValidator(8,
                          errorText: "Password should be up to 8 character"),
                    ]),
                  ),
                  SizedBox(height: height * 0.06),
                  AppUiStateBinding.bind<AuthViewModel, AuthState>(
                      value: (vm) => vm.loginState,
                      to: (context, state, vm) {
                        return AppBTN(
                          title: 'SIGN IN',
                          onTap: () {
                            _signInUser(context);
                          },
                        );
                      }),
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
        ),
      ),
    );
  }

  void _signInUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      var viewModel = Provider.of<AuthViewModel>(context, listen: false);
      viewModel.loginUser(
          email: _emailController.text, password: _passwordController.text);
    }
  }
}
