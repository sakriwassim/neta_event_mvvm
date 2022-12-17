
import 'package:flutter/material.dart';

class AppBarUserWidget extends StatelessWidget {
  const AppBarUserWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        shadowColor: Colors.white,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ));
  }
}
