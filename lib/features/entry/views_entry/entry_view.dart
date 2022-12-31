import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/login_authentification_view.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/string.dart';
import '../../authentification/authentification_repositories/authentification_api.dart';
import '../../authentification/view_model_authentification/authentification_view_model.dart';
import '../../into_screen/view/home_page.dart';
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

    //  SharedPreferences prefs = await SharedPreferences.getInstance();
    //   prefs.clear();
    //   prefs.setString("token", authentificationtoken.toString());

  gettoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    return token;
  }

  _navigatettologin() async {
    Timer(const Duration(seconds: 2), () async {
      print("tokennnnnn***   $token");
      //var token = "fljghkjgh";
      if (token.toString().isNotEmpty || token != "" || token != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginView(),
            ));
      } else {
        //ScreenOne//MyHomePage
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const IntoScreen(),
            ));
      }
    });
  }

  _navigatettohomepage() async {
    Timer(const Duration(seconds: 2), () async {
      print("tokennnnnn***   $token");
      //var token = "fljghkjgh";
      if (token.toString().isNotEmpty || token != "" || token != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const IntoScreen(),
            ));
      } else {
        //ScreenOne//MyHomePage
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const IntoScreen(),
            ));
      }
    });
  }

  _navigatettointo() async {
    Timer(const Duration(seconds: 2), () async {
      print("tokennnnnn***   $token");
      //var token = "fljghkjgh";
      if (token.toString().isNotEmpty || token != "" || token != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const IntoScreen(),
            ));
      } else {
        //ScreenOne//MyHomePage
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const IntoScreen(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    // gettoken();
    if (!_isSet) {

   
      _navigatettologin();
      _isSet = true;
    } else {
      _navigatettointo();
    }

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
