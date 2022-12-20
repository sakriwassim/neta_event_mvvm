import 'package:flutter/material.dart';

import '../colors.dart';

class SelectButtonTrue extends StatelessWidget {
  String text;
  double height;
  double width;
  double fontSize;
  dynamic fontWeight;
  LinearGradient gradientbackground;

  SelectButtonTrue(
      {Key? key,
      required this.text,
      required this.height,
      required this.width,
      required this.fontSize,
      required this.gradientbackground,
      required this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: gradientbackground,
      ),
      child: Card(
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
              foreground: Paint()..shader = linearGradient,
            ),
          ),
        ),
      ),
    );
  }
}

class SelectButtonFalse extends StatelessWidget {
  SelectButtonFalse({
    Key? key,
    required this.height,
    required this.width,
    required this.gradientbackground,
    required this.text,
    required this.fontWeight,
    required this.fontSize,
  }) : super(key: key);

  double height;
  double width;
  LinearGradient gradientbackground;
  String text;
  dynamic fontWeight;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: gradientbackground,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
