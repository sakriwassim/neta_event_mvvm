import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/int.dart';

import '../../../core/Screen/payment_screen.dart';
import '../../../core/size_config.dart';
import '../../../core/string.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';

class PackCardWidget extends StatelessWidget {
  String libelle;
  String montant;
  String nbre_events;
  String nbre_jr_pubs;

  PackCardWidget({
    Key? key,
    required this.libelle,
    required this.montant,
    required this.nbre_events,
    required this.nbre_jr_pubs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: getProportionateScreenWidth(200),
      height: getProportionateScreenHeight(300),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          //color: Colors.green,
          height: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  Spacer(),
                  Container(
                    //color: Colors.blue,
                    child: SvgPicture.asset(Vector),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                  //   color: Colors.blue,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                //color: Colors.blue,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment(-1, -0.643),
                          end: Alignment(1.086, 1.154),
                          colors: <Color>[
                            Color(0xff946d6d),
                            Color(0x56bca3a3),
                            Color(0xff956d6d)
                          ],
                          stops: <double>[0, 0.54, 1],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      // color: Color.fromARGB(255, 173, 2, 225),
                      child: Center(
                        child: TextAirbnbCereal(
                          color: Color.fromARGB(255, 0, 0, 0), //4F4F4F
                          fontWeight: FontWeight.w500,
                          size: 20,
                          title: libelle,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextAirbnbCereal(
                      color: Color.fromARGB(255, 0, 0, 0), //4F4F4F
                      fontWeight: FontWeight.w400,
                      size: 25,
                      title: '$montant fcfa',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(5),
                          ),
                          child: SvgPicture.asset(check),
                        ),
                        TextAirbnbCereal(
                          color: Color.fromARGB(255, 0, 0, 0), //4F4F4F
                          fontWeight: FontWeight.w400,
                          size: 16,
                          title: '$nbre_events évenèments',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(5),
                          ),
                          child: SvgPicture.asset(check),
                        ),
                        TextAirbnbCereal(
                          color: Color.fromARGB(255, 0, 0, 0), //4F4F4F
                          fontWeight: FontWeight.w400,
                          size: 16,
                          title: '$nbre_jr_pubs jours de publicité',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentScreen(
                                        addTontineModel: null,
                                      )));
                        },
                        child: Button(
                          text: "ACHETER",
                          fontSize: fontSizeminibutton,
                          height: getProportionateScreenHeight(28),
                          width: getProportionateScreenWidth(94),
                          fontWeight: FontWeight.normal,
                          backgroundcolor: Color.fromRGBO(255, 255, 255, 0.63),
                          textcolor: Colors.black,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
