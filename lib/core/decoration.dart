import 'package:flutter/material.dart';

InputDecoration textFieldDecoration(String labelText, String hintText) {
  //var labelText = labelText.toString(); ;
  // String hintText;

  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 255, 0, 208)),
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1,
        )),
    labelText: labelText,
    labelStyle: TextStyle(
      color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
    ),
    hintText: hintText,
  );
}

//'Adresse e-mail',
//'entre le email',

InputDecoration textFieldDecorationWithicon(
    String labelText, String hintText, IconData nameOfIcon, Color colorOfIcon) {
  //var labelText = labelText.toString(); ;
  // String hintText;

  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 255, 0, 208)),
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(
          width: 1,
        )),
    labelText: labelText,
    prefixIcon: Icon(
      nameOfIcon,
      color: colorOfIcon,
    ),
    labelStyle: TextStyle(
      color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
    ),
    hintText: hintText,
  );
}

//'Adresse e-mail',
//'entre le email',
