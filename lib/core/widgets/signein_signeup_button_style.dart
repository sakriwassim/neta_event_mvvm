import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/colors.dart';

class SigneInUpButton extends StatelessWidget {
  String text;
  SigneInUpButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
          gradient: gradientbackground,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
