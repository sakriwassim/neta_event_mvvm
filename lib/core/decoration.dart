import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

InputDecoration textFieldDecoration(String labelText, String hintText) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 255, 0, 208)),
    ),
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          width: 1,
        )),
    labelText: labelText,
    labelStyle: const TextStyle(
      color: Colors.grey, //<-- SEE HERE
    ),
    hintText: hintText,
  );
}

InputDecoration textFieldDecorationWithicon(
    String labelText, String hintText, Color colorOfIcon, String pathicon) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 255, 0, 208)),
    ),
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          width: 1,
        )),
    labelText: labelText,
    prefixIcon: Padding(
      padding: const EdgeInsets.all(15),
      child: SvgPicture.asset(pathicon),
    ),
    labelStyle: const TextStyle(
      color: Colors.grey, //<-- SEE HERE
    ),
    hintText: hintText,
  );
}
