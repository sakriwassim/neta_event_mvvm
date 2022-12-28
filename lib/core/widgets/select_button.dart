import 'package:flutter/material.dart';

import '../colors.dart';

class SelectButton extends StatelessWidget {
  String text;
  double height;
  double width;
  double fontSize;
  dynamic fontWeight;
  LinearGradient gradientbackground;
  bool? isSelected;

  SelectButton(
      {Key? key,
      required this.text,
      required this.height,
      required this.width,
      required this.fontSize,
      required this.gradientbackground,
      required this.fontWeight,
      this.isSelected = false})
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
      child: isSelected == false
          ? Container(
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
            )
          : Card(
              child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                  foreground: Paint()..shader = linearGradient,
                ),
              ),
            )),
    );
  }
}
