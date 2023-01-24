import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:neta_event_mvvm/core/theme_data.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/authentification_view.dart';
import 'features/authentification/view_model_authentification/authentification_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
  final skipinto = prefs.getBool("skipinto") ?? false;

  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthentificationViewModel>(
        create: (_) => AuthentificationViewModel(),
      ),
    ],
    child: MyApp(
      isLoggedIn: isLoggedIn,
      skipinto: skipinto,
    ),
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
        home: AuthView());

    //  skipinto
    //     ? isLoggedIn
    //         ? const MainHomePage()
    //         : const AuthView()
    //     : const IntoScreen());
  }
}
