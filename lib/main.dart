// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/home/home_view.dart';
import 'package:neta_event_mvvm/features/into_screen/view/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:neta_event_mvvm/core/theme_data.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/login_authentification_view.dart';
import 'package:neta_event_mvvm/features/entry/views_entry/entry_view.dart';

import 'core/Screen/payment_screen.dart';
import 'features/authentification/views_authentification/register_authentification_view.dart';
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

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final bool skipinto;
  const MyApp({
    Key? key,
    required this.isLoggedIn,
    required this.skipinto,
  }) : super(key: key);

  // StatefulWidget tree() {
  //   if (this.skipinto) {
  //     if (this.isLoggedIn) {
  //       return MyHomePage();
  //     } else {
  //       return LoginView();
  //     }
  //   } else {
  //     return IntoScreen();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themedata(),

        //home: LoginView(),
        //home: RegisterView(),
        // home: OneUserView(),
        //home: PaymentScreen(),
        home: skipinto
            ? isLoggedIn
                ? MyHomePage()
                : LoginView()
            : IntoScreen()

        //  tree()
        // home: const MyHomePage(),
        //home: GetAllTicketView(),
        );
  }
}
