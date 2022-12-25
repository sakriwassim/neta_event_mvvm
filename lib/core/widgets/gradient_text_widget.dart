import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/colors.dart';

class GradientTextWidget extends StatelessWidget {
  String text;
  double size;
  FontWeight fontWeight;
  GradientTextWidget({
    Key? key,
    required this.text,
    required this.size,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        foreground: (Paint()..shader = linearGradient),
        //foreground: foreground,
        fontFamily: 'AirbnbCereal',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        //color: Colors.black,
      ),
    );
  }
}
