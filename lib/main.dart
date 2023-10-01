import 'package:fit_food/features/chats/chat_screen.dart';
import 'package:fit_food/features/onboarding/view/splash_screen.dart';
import 'package:fit_food/features/screens/sign_in.dart';
import 'package:fit_food/features/screens/sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
      routes: {
        '/signIn': (ctx) => const SignIn(),
        '/signUp': (ctx) => const SignUp(),
        '/chats': (ctx) => const ChatScreen(),
      },
    );
  }
}
