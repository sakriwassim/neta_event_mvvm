import 'package:flutter/material.dart';

class HomeViewModel {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  Future openDrawer() async {
    _scaffoldState.currentState!.openDrawer();
  }
}
