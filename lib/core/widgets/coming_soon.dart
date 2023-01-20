
import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // color: Colors.blue,
        height: 50,
        child: Center(
            child: Text(
          "Coming Soon",
          style: TextStyle(fontSize: 25),
        )),
      ),
    );
  }
}
