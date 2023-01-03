// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/colors.dart';

class TextAirbnbCereal extends StatelessWidget {
  String title;
  double size;
  Color? color;
  FontWeight fontWeight;

  TextAirbnbCereal({
    Key? key,
    required this.title,
    required this.size,
    required this.color,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'AirbnbCereal',
        fontWeight: fontWeight,
        fontSize: size,
        color: color,
      ),
    );
  }
}
