import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/authentication/data/repository/auth_repository_impl.dart';
import 'features/authentication/viewmodel/auth_view_model.dart';
import 'features/authentication/views/sign_in.dart';
import 'features/authentication/views/sign_up.dart';

import 'features/chats/chat_screen.dart';
import 'features/onboarding/view/splash_screen.dart';

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
    '/settings': (ctx) => const SettingsScreen(),
    '/edit-profile': (ctx) => const EditProfile(),
    },

      ),
    );
  }
}
