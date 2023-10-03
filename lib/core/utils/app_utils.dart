import 'dart:developer';

import 'package:fit_food/components/shared/app_colors.dart';
import 'package:fit_food/core/constants/storage_keys.dart';
import 'package:fit_food/core/helpers/storage_helper.dart';
import 'package:fit_food/features/authentication/views/sign_in.dart';
import 'package:fit_food/features/chats/chat_screen.dart';
import 'package:fit_food/features/onboarding/view/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static loadingProgress(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.3),
        builder: (context) {
          return const Center(
            child: CupertinoActivityIndicator(
              color: kcBtnColor,
              radius: 15,
            ),
          );
        });
  }

  static loading() {
    return const Center(
      child: SizedBox(
        width: 25,
        height: 25,
        child: CupertinoActivityIndicator(
          color: kcBtnColor,
          radius: 15,
        ),
      ),
    );
  }

  static String getTimeOfDay() {
    final currentTime = DateTime.now().hour;

    if (currentTime < 12) {
      return '  Morning';
    } else if (currentTime < 17) {
      return 'Afternoon';
    } else {
      return 'Evening';
    }
  }

  static Future<Widget> getFirstScreen() async {
    bool hasOnboarded =
        await StorageHelper.getBoolean(StorageKeys.isOnboarded, false);
    bool isLoggedIn =
        await StorageHelper.getBoolean(StorageKeys.isLoggedIn, false);

// String? token =
// await StorageHelper.getString(StorageKeys.token);
    log("IS ANONYMOUS USER: $hasOnboarded");
    log("IS LOGGED IN: $isLoggedIn");
    if (hasOnboarded) {
      if (isLoggedIn) {
        return const ChatScreen();
      } else {
        return const SignIn();
      }
    } else {
      return const OnboardingScreen();
    }
  }
}
