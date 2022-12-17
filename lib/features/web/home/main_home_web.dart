import 'package:flutter/material.dart';

import '../../../core/responsive.dart';
import 'home_view_web.dart';
import 'home_view_web_phone.dart';
import 'home_view_web_tab.dart';

class MainHomeWeb extends StatefulWidget {
  const MainHomeWeb({super.key});

  @override
  State<MainHomeWeb> createState() => _MainHomeWebState();
}

class _MainHomeWebState extends State<MainHomeWeb> {
  @override
  Widget build(BuildContext context) {
    // final orientationDevice = MediaQuery.of(context).orientation;

    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    if (Responsive.isDesktop(context)) {
      return HomeViewWeb();
    }
    if (Responsive.isTablet(context)) {
      return HomeViewWebTab();
    }
    return HomeViewWebPhone();
  }
}
