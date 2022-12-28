import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/theme_data.dart';
import 'package:neta_event_mvvm/features/entry/views_entry/entry_view.dart';
import 'core/Screen/payment_screen.dart';
import 'features/home/bottom_navigation_bar.dart';
import 'features/tontines/views_tontines/add_tontine_view.dart';
import 'features/users/view_profil/one_user_view.dart';

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
      // home: OneUserView(),
      //home: PaymentScreen(),
      //home: SplashScreen(),
      home: const MyHomePage(),
      //home: GetAllTicketView(),
    );
  }
}
