import 'dart:async';
import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/login_authentification_view.dart';

import '../../../bottom_navigation_bar.dart';
import '../entry_repositories/events_local.dart';
import '../view_model_entry/events_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;
  static bool _isSet = false;
  var data = EntryViewModel(entryRepository: EntryLocal());


  _navigatettohomepage() async {
    var token = await data.Gettokenformpref();
    //print(token);
    Timer(const Duration(seconds: 5), () async {
      if (token.isNotEmpty || token != "" || token != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginView(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MyHomePage(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (!_isSet) {
    _navigatettohomepage();
    // _isSet = true;
    // }

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
