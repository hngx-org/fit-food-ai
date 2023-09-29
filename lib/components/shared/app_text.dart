import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTXT extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final bool softWrap;
  final double? height;

  const AppTXT({
    super.key,
    required this.text,
    this.textAlign,
    this.height,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.softWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: softWrap,
      textScaleFactor: MediaQuery.textScaleFactorOf(context),
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}
