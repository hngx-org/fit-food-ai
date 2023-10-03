import 'package:fit_food/components/shared/app_colors.dart';
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
          color:kcBtnColor,
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

}