import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/authentification_view.dart';
import 'package:neta_event_mvvm/features/home/home_view.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/string.dart';
import '../../authentification/authentification_repositories/authentification_api.dart';
import '../../authentification/view_model_authentification/authentification_view_model.dart';
import '../../into_screen/view/intro_page.dart';
import '../entry_repositories/events_local.dart';
import '../view_model_entry/events_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var data = EntryViewModel(entryRepository: EntryLocal());

  // var datatoken = AuthentificationViewModel(
  //     authentificationRepository: AuthentificationApi());

  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // token = prefs.getString("token");

  _navigatettohomepage() {
    Timer(const Duration(seconds: 2), () async {
      final prefs = await SharedPreferences.getInstance();
      final isLoggedin = prefs.getBool("isLoggedIn");
      if (isLoggedin == true) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AuthView(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeView(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _navigatettohomepage();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  // color: Colors.blue,
                  child: SvgPicture.asset(splashScreen1)),
              SizedBox(
                height: 20,
              ),
              Container(
                  // color: Colors.red,
                  child: SvgPicture.asset(splashScreen2)),
            ],
          ),
        ),
      ),
    );
  }
}
