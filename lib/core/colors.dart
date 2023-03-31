import 'package:flutter/material.dart';

const coloricon = Color.fromRGBO(210, 40, 106, 1);

const gradientbackground = LinearGradient(
  colors: [Color.fromRGBO(131, 1, 188, 1), Color(0xFFD2286A)],
);

const gradientbackgroundticket = LinearGradient(
  colors: [Color.fromARGB(255, 25, 1, 204), Color.fromARGB(255, 6, 2, 83)],
);

final Shader linearGradient = const LinearGradient(
  colors: <Color>[
    Color.fromRGBO(131, 1, 188, 1),
    Color.fromRGBO(210, 40, 106, 1)
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
