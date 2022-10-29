import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/widgets/medium_button.dart';
import 'package:neta_event_mvvm/core/widgets/text_widget_text1.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/login_authentification_view.dart';

import '../../core/widgets/big_button_style.dart';
import '../../core/widgets/text_widget_text2.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          shadowColor: Colors.white,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SizedBox(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/intro/imagescreen3.png"),
                  TextWidgetText2(
                    title: "des événements tout au long de l'année",
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                    },
                    child: BigButton(text: "Commencer"),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
