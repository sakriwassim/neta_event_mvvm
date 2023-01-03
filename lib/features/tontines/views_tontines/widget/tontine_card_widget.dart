import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/colors.dart';

import '../../../../core/Screen/payment_screen.dart';
import '../../../../core/int.dart';
import '../../../../core/size_config.dart';
import '../../../../core/string.dart';
import '../../../../core/widgets/image_cached_internet.dart';
import '../../../../core/widgets/small_button_style.dart';
import '../../../../core/widgets/text_widget_text1.dart';
import '../triangle_painter.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
      ),
      child: SizedBox(
        height: double.infinity,
        width: getProportionateScreenWidth(220),
        //color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    /// color: Colors.blue,
                    height: getProportionateScreenHeight(80),
                    width: double.infinity,
                    child: CustomPaint(
                      painter: TrianglePainter(
                        // strokeColor: Color.fromARGB(149, 216, 6, 202),
                        strokeWidth: 10,
                        paintingStyle: PaintingStyle.fill,
                        linearGradient: linearGradient,
                      ),
                    ),
                  ),
                  SizedBox(
                    // color: Color.fromARGB(255, 0, 255, 38),
                    width: getProportionateScreenWidth(40),
                    height: getProportionateScreenHeight(40),

                    child: Image.asset(Mask),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),

                  height: getProportionateScreenHeight(220),
                  // color: Colors.white, //220

                  child: Center(
                    child: Column(children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: getProportionateScreenHeight(100),
                        child: ImageCachedInternet(
                          height: MediaQuery.of(context).size.height,
                          imageUrl: '$image',
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextAirbnbCereal(
                              color: const Color(0xffE28541),
                              fontWeight: FontWeight.w500,
                              size: 8,
                              title: '$libelle',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenHeight(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextAirbnbCereal(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                              size: 10,
                              title: '$libelle',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenHeight(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextAirbnbCereal(
                              color: const Color(0xff4F4F4F),
                              fontWeight: FontWeight.w400,
                              size: 10,
                              title: '$montant_regulier\$ Chaque trimestre',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenHeight(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextAirbnbCereal(
                              color: const Color.fromRGBO(79, 79, 79, 1),
                              fontWeight: FontWeight.w500,
                              size: 10,
                              title: '$nbr_participant participants',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(5),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PaymentScreen()));
                                },
                                child: Button(
                                  fontWeight: FontWeight.normal,
                                  text: "Participer",
                                  fontSize: fontSizeminibutton,
                                  gradientbackground: gradientbackground,
                                  height: heightminibutton,
                                  width: widthminibutton,
                                  textcolor: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
