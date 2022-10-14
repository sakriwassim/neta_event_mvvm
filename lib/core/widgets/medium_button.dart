import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/colors.dart';

class MediumButton extends StatelessWidget {
  String text;
  MediumButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 110,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(13.0),
        gradient: gradientbackground,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
