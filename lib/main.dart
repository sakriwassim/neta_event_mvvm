import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neta_event_mvvm/features/home/home_view.dart';
import 'package:neta_event_mvvm/features/into_screen/view/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:neta_event_mvvm/core/theme_data.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/login_authentification_view.dart';
import 'package:neta_event_mvvm/features/entry/views_entry/entry_view.dart';

import 'core/Screen/payment_screen.dart';
import 'features/authentification/views_authentification/register_authentification_view.dart';
import 'features/home/bottom_agent.dart';
import 'features/home/bottom_navigation_bar.dart';
import 'features/tontines/views_tontines/add_tontine_view.dart';
import 'features/users/view_profil/one_user_view.dart';

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
        //home: PaymentScreen(),
        home: MyHomePageAgent()

        //  skipinto
        //     ? isLoggedIn
        //         ? MyHomePage()
        //         : LoginView()
        //     : IntoScreen()

        // home: const MyHomePage(),
        //home: GetAllTicketView(),
        );
  }
}
