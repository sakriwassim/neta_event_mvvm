import 'package:flutter/material.dart';
import 'features/entry/views_entry/entry_view.dart';
import 'features/intro/screen_one.dart';
import 'features/intro/screen_three.dart';
import 'features/intro/screen_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
