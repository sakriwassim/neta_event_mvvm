import 'package:flutter/material.dart';

import '../colors.dart';
import '../string.dart';
import 'text_widget_text1.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 240,
            child: SizedBox.expand(
                child: Image.asset(coming_soon
            )),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
          ),
          TextAirbnbCereal(
            color: Color.fromARGB(255, 6, 222, 196), //4F4F4F
            fontWeight: FontWeight.w500,
            size: 18,
            title: "Bientôt Disponible",
          ),
        ],
      ),
    );
  }
}
