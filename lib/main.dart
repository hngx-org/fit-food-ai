import 'package:fit_food/common/data/user/user_repository_impl.dart';
import 'package:fit_food/common/viewmodels/user_view_model.dart';
import 'package:fit_food/components/shared/app_colors.dart';
import 'package:fit_food/core/utils/app_utils.dart';
import 'package:fit_food/features/authentication/views/upgrade_plan.dart';
import 'package:fit_food/features/chats/view_model/chat_view_model.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var nextScreen = await AppUtils.getFirstScreen();
  runApp(MyApp(
    nextScreen: nextScreen,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.nextScreen});

  final Widget nextScreen;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(AuthRepositoryImpl()),
        ),
        ChangeNotifierProvider<UserViewModel>(
            create: (context) => UserViewModel(UserRepositoryImpl())),
        ChangeNotifierProvider<ChatViewModel>(
            create: (context) => ChatViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: kcBtnColor,
          ),
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
        home: SplashScreen(
          nextScreen: nextScreen,
        ),
        routes: {
          '/signIn': (ctx) => const SignIn(),
          '/signUp': (ctx) => const SignUp(),
          '/chats': (ctx) => const ChatScreen(),
          '/settings': (ctx) => const SettingsScreen(),
          '/edit-profile': (ctx) => const EditProfile(),
          '/upgradePlan': (ctx) => const UpgradePlan(),
        },
      ),
    );
  }
}
