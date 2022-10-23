import 'package:flutter/material.dart';

import '../../../../core/widgets/mini_acheter_button.dart';

class PackCardWidget extends StatelessWidget {
  String libelle;
  PackCardWidget({Key? key, required this.libelle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 300,
          child: Stack(children: <Widget>[
            Image.asset("assets/packs_bg/$libelle.png"),
            //Image.asset("assets/packs_bg/gold.png"),
            Container(
              height: 250,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    libelle,
                    style: const TextStyle(
                        fontFamily: 'AirbnbCereal',
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                 const Text(
                    '10 euro',
                    style: TextStyle(
                        fontFamily: 'AirbnbCereal',
                        fontSize: 30,
                        fontWeight: FontWeight.w300),
                  ),
                 const Text(
                    '3 évenèments',
                    style:  TextStyle(
                        fontFamily: 'AirbnbCereal',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    '7 jours de publicité',
                    style:  TextStyle(
                        fontFamily: 'AirbnbCereal',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  // Text(
                  //   textAlign: TextAlign.center,
                  //   'Acheter',
                  //   style: TextStyle(
                  //       fontFamily: 'AirbnbCereal',
                  //       fontSize: 14,
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.w400),
                  // ),
                  InkWell(
                      onTap: () {}, child: MiniAcheterButton(text: "ACHETER")),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
