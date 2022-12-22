import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/theme_data.dart';
import 'features/home/bottom_navigation_bar.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themedata(),
      //home: IntoScreen(),
      // home: LoginView(),
      //home: SplashScreen(),
      home: const MyHomePage(),
    );
  }
}
