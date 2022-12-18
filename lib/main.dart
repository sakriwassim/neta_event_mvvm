import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neta_event_mvvm/core/theme_data.dart';
import 'package:provider/provider.dart';
import 'features/authentification/views_authentification/login_authentification_view.dart';
import 'features/entry/views_entry/entry_view.dart';
import 'features/home/bottom_navigation_bar.dart';
import 'features/home/home_view.dart';
import 'features/into_screen/utils/colors.dart';
import 'features/web/home/home_view_web.dart';
import 'features/web/home/home_view_web_phone.dart';
import 'features/web/home/home_view_web_tab.dart';
import 'features/web/home/main_home_web.dart';
import 'features/web/user/main_web_user_view.dart';
import 'features/web/web_authentification_view/login_signup_web_view.dart';
import 'features/web/web_authentification_view/main_authentification_web.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themedata(),

      // home: MainHomeWeb(),
      home: MainAuthentificationWeb(),
      //home: WebUserView(),
      //home: SplashScreen(),
      //home: MyHomePage(),
    );
  }
}
