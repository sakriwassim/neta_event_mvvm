import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String title;
  double fontSize;
  TextWidget({Key? key, required this.title, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
          fontFamily: 'AirbnbCereal',
          color: Colors.black,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ));
  }
}
