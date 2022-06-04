import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? color;
  const CustomText({
    required this.text,
    this.textStyle,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: color ?? Colors.purple, fontWeight: FontWeight.bold)),
      textAlign: TextAlign.center,
    );
  }
}
