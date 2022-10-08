import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/colors.dart';

class BigButton extends StatelessWidget {
  String text;
  BigButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
          gradient: gradientbackground,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
