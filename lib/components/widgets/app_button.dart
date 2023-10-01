import 'package:fit_food/components/shared/app_colors.dart';
import 'package:fit_food/components/shared/styles.dart';
import 'package:flutter/material.dart';

class AppBTN extends StatelessWidget {
  final String title;
  final Color? color;
  final void Function()? onTap;
  const AppBTN({
    super.key,
    required this.title,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      splashColor: kcRedColorLight,
      child: Container(
        width: double.infinity,
        height: height * 0.065,
        decoration: BoxDecoration(
          color: kcBtnColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: btnText,
          ),
        ),
      ),
    );
  }
}
