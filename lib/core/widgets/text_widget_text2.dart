import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String title;
  double fontSize;
  FontWeight fontWeight;
  TextWidget(
      {Key? key,
      required this.title,
      required this.fontSize,
      required this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          //fontFamily: "AirbnbCereal",
          color: Colors.black,
          fontSize: fontSize,
        ));
  }
}
