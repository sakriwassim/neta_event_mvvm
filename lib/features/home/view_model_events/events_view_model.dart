import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  Future openDrawer() async {
    _scaffoldState.currentState!.openDrawer();
  }

  Future Getuserrole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userrole = prefs.getInt("userrole");
    return userrole;
  }
}
