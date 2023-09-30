import 'package:fit_food/screens/sign_up.dart';
import 'package:flutter/material.dart';

import '../components/shared/app_colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('Welcome Back!',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,

                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('Fill in your details to continue',
                style: TextStyle(
                    fontFamily: ''
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kcChatRcvdColor,// Customize the border color
                    width: 1.0,          // Customize the border width
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: Icon(Icons.person_2_outlined,
                      color: kcChatRcvdColor,),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kcChatRcvdColor,// Customize the border color
                    width: 1.0,          // Customize the border width
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: TextField(
                  obscureText: _passwordVisible,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outlined,
                      color: kcChatRcvdColor,),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      child: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: kcChatRcvdColor,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Align(alignment: Alignment.centerRight,
                child: TextButton( onPressed: () {

                },
                  child: Text('Forgot Password?',
                    style: TextStyle(
                      color: kcTxtColorDark,
                      fontWeight: FontWeight.w200
                    ),
                  ),),
            ),
            Center(
              child: SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ElevatedButton(onPressed: () {},
                    style:  ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kcBtnColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),

                    child: const Text(
                      'SIGN IN',
                      style: TextStyle(
                          color: kcWhiteColor,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w700
                      ),
                    ),


                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('New User?',
                  ),
                  TextButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                    child: const Text('Create Account',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: kcTxtColorDark
                      ),
                    ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
