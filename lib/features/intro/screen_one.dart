import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/widgets/medium_button.dart';
import 'package:neta_event_mvvm/core/widgets/text_widget_text1.dart';
import 'package:neta_event_mvvm/features/intro/screen_two.dart';

import '../../core/widgets/big_button_style.dart';
import '../../core/widgets/text_widget_text2.dart';
import '../authentification/views_authentification/login_authentification_view.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // add more IconButton

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
                  Image.asset("assets/intro/imagescreen1.png"),
                  TextWidgetText2(
                    title: "l'achat de vos ticket est devenu facile avec nous ",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginView()));
                          },
                          child: TextWidgetText2(title: "Passer")),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreenTwo()));
                        },
                        child: BigButton(text: "Apres"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
