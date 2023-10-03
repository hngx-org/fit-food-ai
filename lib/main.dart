import 'package:fit_food/components/shared/app_colors.dart';
import 'package:fit_food/features/screens/payment_upgrade.dart';
import 'package:flutter/material.dart';

import 'features/chats/chat_screen.dart';
import 'features/onboarding/view/splash_screen.dart';
import 'features/screens/sign_in.dart';
import 'features/screens/sign_up.dart';
import 'features/settings/presentation/edit_profile.view.dart';
import 'features/settings/presentation/settings_view.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: kcTxtColorDark),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const UpgradePlan(),
      routes: {
        '/signIn': (ctx) => const SignIn(),
        '/signUp': (ctx) => const SignUp(),
        '/chats': (ctx) => const ChatScreen(),
        '/settings': (ctx) => const SettingsScreen(),
        '/edit-profile': (ctx) => const EditProfile(),
      },
    );
  }
}
