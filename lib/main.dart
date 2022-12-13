import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'features/authentification/views_authentification/login_authentification_view.dart';
import 'features/home/bottom_navigation_bar.dart';
import 'features/home/home_view.dart';
import 'features/into_screen/utils/colors.dart';
import 'features/web/home/home_view_web.dart';
import 'features/web/home/home_view_web_phone.dart';
import 'features/web/home/home_view_web_tab.dart';
import 'features/web/web_view/login_signup_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
      )),
      home: HomeViewWebPhone(),
      //home: HomeViewWeb(),
      //home: LoginSignupView(),
      //home: SplashScreen(),
      //home: MyHomePage(),
    );
  }
}
