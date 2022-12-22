import 'package:flutter/material.dart';

const gradientbackground = LinearGradient(
  colors: [Color.fromRGBO(131, 1, 188, 1), Color.fromRGBO(210, 40, 106, 1)],
);

final Shader linearGradient = const LinearGradient(
  colors: <Color>[
    Color.fromRGBO(131, 1, 188, 1),
    Color.fromRGBO(210, 40, 106, 1)
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
