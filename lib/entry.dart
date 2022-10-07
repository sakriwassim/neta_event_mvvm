import 'dart:async';
import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/login_authentification_view.dart';
import 'package:neta_event_mvvm/home_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;
  static bool _isSet = false;

  gettokenformpref() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString("token");
      // print(token);
      return token;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    gettokenformpref();
    _navigatettohomepage();
    super.initState();
  }

  _navigatettohomepage() async {
    //await Future.delayed(const Duration(milliseconds: 1500), () {});
    Timer(Duration(seconds: 5), () async {
      if (token != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginView(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isSet) {
      _navigatettohomepage();
      _isSet = true;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/SlashScreen/netaLogo.png',
              height: 200,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
