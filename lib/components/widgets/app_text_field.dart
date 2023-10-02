import 'package:fit_food/components/shared/app_colors.dart';
import 'package:flutter/material.dart';
import '../shared/styles.dart';

class AppTXTField extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final String hint;
  final void Function(String)? onChanged;
  final bool obscure;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  AppTXTField({
    super.key,
    this.trailing,
    this.leading,
    required this.hint,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.obscure = false,
  });

  final txtRadius = OutlineInputBorder(
    borderSide: const BorderSide(
      color: kcChatRcvdColor,
    ),
    borderRadius: BorderRadius.circular(12),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: inputText,
      controller: controller,
      onChanged: onChanged,
      obscureText: obscure,
      keyboardType: keyboardType,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        prefixIcon: leading,
        suffixIcon: trailing,
        hintText: hint,
        hintStyle: hintText,
        enabledBorder: txtRadius,
        focusedBorder: txtRadius,
        errorBorder: txtRadius.copyWith(
          borderSide: const BorderSide(
            color: kcBtnColor,
          ),
        ),
        focusedErrorBorder: txtRadius.copyWith(
          borderSide: const BorderSide(
            color: kcBtnColor,
          ),
        ),
      ),
    );
  }
}
