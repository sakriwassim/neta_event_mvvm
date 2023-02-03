import 'package:flutter/material.dart';

import '../features/into_screen/utils/colors.dart';

ThemeData themedata() {
  return ThemeData(
      // splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,
      // hoverColor: Colors.transparent,
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 25,
          color: MyColors.titleTextColor,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
            fontSize: 18,
            color: MyColors.subTitleTextColor,
            fontWeight: FontWeight.w400,
            wordSpacing: 1.2,
            height: 1.2),
        headline3: TextStyle(
          fontSize: 18,
          color: MyColors.titleTextColor,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ));
}
