import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/colors.dart';

import '../../../../core/int.dart';
import '../../../../core/size_config.dart';
import '../../../../core/string.dart';
import '../../../../core/widgets/small_button_style.dart';
import '../../../../core/widgets/text_widget_text1.dart';

class TontineCardWidget extends StatelessWidget {
  String? libelle;
  String? nbr_participant;
  String? montant_regulier;
  String? image;
  TontineCardWidget({
    Key? key,
    required this.libelle,
    required this.nbr_participant,
    required this.montant_regulier,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // decoration: const BoxDecoration(boxShadow: [
              //   BoxShadow(
              //       // blurRadius: 1000.0,
              //       ),
              // ]),
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(200),
              child: CustomPaint(
                painter: TrianglePainter(
                  // strokeColor: Color.fromARGB(149, 216, 6, 202),
                  strokeWidth: 10,
                  paintingStyle: PaintingStyle.fill,
                  linearGradient: linearGradient,
                ),
              ),
            ),
            Container(
              //color: Colors.blue,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                ),
              ]),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),

                //height: 180,
                width: getProportionateScreenWidth(180),
                // color: Colors.white,
                child: Column(children: [
                  FadeInImage.assetNetwork(
                    width: 230,
                    placeholder: 'assets/lod.gif',
                    image: "$image",
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextAirbnbCereal(
                          color: Color(0xffE28541),
                          fontWeight: FontWeight.w500,
                          size: 8,
                          title: '$libelle',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextAirbnbCereal(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                          size: 10,
                          title: '$libelle',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextAirbnbCereal(
                          color: Color(0xff4F4F4F),
                          fontWeight: FontWeight.w400,
                          size: 10,
                          title: '$montant_regulier\$ Chaque trimestre',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextAirbnbCereal(
                          color: Color.fromRGBO(79, 79, 79, 1),
                          fontWeight: FontWeight.w500,
                          size: 10,
                          title: '$nbr_participant participants',
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Button(
                          fontWeight: FontWeight.normal,
                          text: "Participer",
                          fontSize: fontSizeminibutton,
                          gradientbackground: gradientbackground,
                          height: heightminibutton,
                          width: widthminibutton,
                          textcolor: Colors.white,
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;
  Shader linearGradient;

  TrianglePainter(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke,
      required this.linearGradient});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = linearGradient
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
