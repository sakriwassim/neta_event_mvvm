import 'package:flutter/material.dart';

class TextWidgetText2 extends StatelessWidget {
  String title;
  TextWidgetText2({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
          fontFamily: 'AirbnbCereal',
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ));
  }
}
