import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/views/events/events_view.dart';
import 'package:neta_event_mvvm/views/events/one_event_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EventView(),
    );
  }
}
