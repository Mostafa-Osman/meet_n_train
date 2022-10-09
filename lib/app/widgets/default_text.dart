import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final Color textColor;

  const DefaultText(
      {Key? key,
      required this.title,
      this.fontSize = 18.0,
      this.fontWeight = FontWeight.w500,
      this.fontFamily = 'Poppins',
      this.textColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        color: textColor,
      ),
    );
  }
}
