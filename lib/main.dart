import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/into_screen/view/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:neta_event_mvvm/core/theme_data.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/authentification_view.dart';

import 'features/home/bottom_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
  final skipinto = prefs.getBool("skipinto") ?? false;

  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
    skipinto: skipinto,
  ));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final bool skipinto;
  const MyApp({
    Key? key,
    required this.isLoggedIn,
    required this.skipinto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: themedata(),

        //home: LoginView(),
        //home: RegisterView(),
        // home: OneUserView(),
        // home: MyHomePage(),
        //  MyHomePageAgent()

        home: skipinto
            ? isLoggedIn
                ? MyHomePage()
                : AuthView()
            : IntoScreen()

        // home: const MyHomePage(),
        //home: GetAllTicketView(),
        );
  }
}
