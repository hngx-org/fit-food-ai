import 'package:flutter/material.dart';

class AppTILE extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final Widget? title;
  final String? text;
  final void Function()? onTap;

  const AppTILE({
    super.key,
    this.leading,
    this.trailing,
    this.title,
    this.onTap,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
