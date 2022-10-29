import 'package:flutter/material.dart';

class TextWidgetText1 extends StatelessWidget {
  String title;
   TextWidgetText1({
    Key? key,required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
      ),
    );
  }
}
