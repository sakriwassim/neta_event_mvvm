import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/responsive.dart';
import 'login_authentification_mobile_tab_view.dart';
import 'login_signup_web_view.dart';

class MainAuthentificationWeb extends StatefulWidget {
  const MainAuthentificationWeb({super.key});

  @override
  State<MainAuthentificationWeb> createState() =>
      _MainAuthentificationWebState();
}

class _MainAuthentificationWebState extends State<MainAuthentificationWeb> {
  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return LoginSignupViewWeb();
    }
    if (Responsive.isTablet(context)) {
      return LoginViewTabMobile();
    }
    return LoginViewTabMobile();
  }
}
