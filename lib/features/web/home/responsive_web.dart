import 'package:flutter/material.dart';

import 'home_view_web.dart';
import 'home_view_web_phone.dart';
import 'home_view_web_tab.dart';

class ResponsiveWeb extends StatefulWidget {
  const ResponsiveWeb({super.key});

  @override
  State<ResponsiveWeb> createState() => _ResponsiveWebState();
}

class _ResponsiveWebState extends State<ResponsiveWeb> {
  @override
  Widget build(BuildContext context) {
    final orientationDevice = MediaQuery.of(context).orientation;

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 950) {
      return HomeViewWeb();
    }
    if (screenWidth >= 600) {
      return HomeViewWebTab();
    }
    return HomeViewWebPhone();
  }
}//HomeViewWebTab
