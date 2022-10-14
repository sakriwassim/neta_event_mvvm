import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/colors.dart';

class MiniButton extends StatelessWidget {
  String text;
  MiniButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 60,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        gradient: gradientbackground,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
