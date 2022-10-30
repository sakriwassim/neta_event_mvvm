import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/widgets/medium_button.dart';
import 'package:neta_event_mvvm/core/widgets/text_widget_text1.dart';
import 'package:neta_event_mvvm/features/intro/screen_one.dart';
import 'package:neta_event_mvvm/features/intro/screen_three.dart';

import '../../core/widgets/big_button_style.dart';
import '../../core/widgets/text_widget_text2.dart';
import '../authentification/views_authentification/login_authentification_view.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const ScreenOne()));
            },
          ),
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
                  Image.asset("assets/intro/imagescreen2.png"),
                  TextWidgetText2(
                    title: "Payer vos tickets en toute securite",
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
                                  builder: (context) => ScreenThree()));
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
