import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/colors.dart';

class SmallButton extends StatelessWidget {
  String text;
  SmallButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: gradientbackground,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
