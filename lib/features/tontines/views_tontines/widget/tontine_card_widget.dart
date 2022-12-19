import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/colors.dart';

import '../../../../core/int.dart';
import '../../../../core/widgets/small_button_style.dart';

class TontineCardWidget extends StatelessWidget {
  String? libelle;
  String? nbr_participant;
  String? montant_regulier;
  TontineCardWidget({
    Key? key,
    required this.libelle,
    required this.nbr_participant,
    required this.montant_regulier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Stack(
        children: [
          ClipPath(
              clipper: TriangleClipper(),
              child: Container(
                decoration: const BoxDecoration(gradient: gradientbackground),
                height: 220,
                width: 220,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 73, left: 20),
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 15.0,
                ),
              ]),
              child: Container(
                height: 180,
                width: 180,
                color: Colors.white,
                child: Column(children: [
                  Image.asset(
                    "assets/téléchargement 4.png",
                    width: 230,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          libelle!,
                          style: const TextStyle(
                              fontFamily: 'AirbnbCereal',
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffE28541)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Lorem espium anturium ka',
                          style: TextStyle(
                            fontFamily: 'AirbnbCereal',
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '$montant_regulier\$ Chaque trimestre',
                          style: const TextStyle(
                            fontFamily: 'AirbnbCereal',
                            fontSize: 10,
                            color: Color(0xff4F4F4F),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '$nbr_participant participants',
                          style: const TextStyle(
                            fontFamily: 'AirbnbCereal',
                            fontSize: 10,
                            color: Color(0xff4F4F4F),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Button(
                              fontWeight: FontWeight.normal,
                          text: "Participer",
                          fontSize: fontSizeminibutton,
                          gradientbackground: gradientbackground,
                          height: heightminibutton,
                          width: widthminibutton,
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width / 2, 0) // point p1
      ..lineTo(0, size.height / 3) // point p2
      ..lineTo(size.width, size.height / 3)
      ..lineTo(size.width / 2, 0) // point p3
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
