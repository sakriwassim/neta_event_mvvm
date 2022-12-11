import 'package:flutter/material.dart';

InputDecoration textFieldDecoration(String labelText, String hintText) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 255, 0, 208)),
    ),
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          width: 1,
        )),
    labelText: labelText,
    labelStyle: const TextStyle(
      color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
    ),
    hintText: hintText,
  );
}

InputDecoration textFieldDecorationWithicon(
    String labelText, String hintText, IconData nameOfIcon, Color colorOfIcon) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 255, 0, 208)),
    ),
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          width: 1,
        )),
    labelText: labelText,
    prefixIcon: Icon(
      nameOfIcon,
      color: colorOfIcon,
    ),
    labelStyle: const TextStyle(
      color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
    ),
    hintText: hintText,
  );
}
