import 'package:fit_food/common/viewmodels/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/shared/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.nextScreen});

  final Widget nextScreen;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserViewModel>(context, listen: false).loadLocalUser();
    });

    Future.delayed(const Duration(seconds: 3)).then(
        (value) => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => widget.nextScreen,
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      body: Center(
        child: Image.asset('assets/appLogo.png'),
      ),
    );
  }
}
