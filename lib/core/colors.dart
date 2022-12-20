import 'package:flutter/material.dart';

const gradientbackground = LinearGradient(
  colors: [Colors.purple, Colors.pink],
);

final Shader linearGradient = LinearGradient(
  colors: <Color>[
    Color.fromARGB(255, 240, 21, 197),
    Color.fromARGB(255, 124, 56, 145)
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
