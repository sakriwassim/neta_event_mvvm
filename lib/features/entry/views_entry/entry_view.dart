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

  gettoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    return token;
  }

  _navigatettohomepage() async {
    //print(token);
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
    gettoken();
    // if (!_isSet) {
    _navigatettohomepage();
    // _isSet = true;
    // }

    print("token :  *****$token");

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        //assets/icons/splashScreen
        child:
            //SvgPicture.asset(splashScreenString),
            Image.asset(
          'assets/SlashScreen/netaLogo.png',
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.2,
        ),
      ),
    );
  }
}
