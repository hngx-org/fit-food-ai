import 'package:fit_food/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:fit_food/features/authentication/viewmodel/auth_view_model.dart';
import 'package:fit_food/features/chats/chat_screen.dart';
import 'package:fit_food/features/onboarding/view/splash_screen.dart';
import 'package:fit_food/features/authentication/views/sign_in.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/authentication/views/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(AuthRepositoryImpl()),
        )
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
