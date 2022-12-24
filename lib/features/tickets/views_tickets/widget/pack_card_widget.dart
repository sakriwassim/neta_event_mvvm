import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/int.dart';

import '../../../../core/colors.dart';
import '../../../../core/size_config.dart';
import '../../../../core/string.dart';
import '../../../../core/widgets/small_button_style.dart';
import '../../../../core/widgets/text_widget_text1.dart';

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
      color: Colors.blue,
      // height: 300,
      width: getProportionateScreenWidth(250),
      child: Card(
        elevation: 5,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: SizedBox(
          height: getProportionateScreenHeight(300),
          width: getProportionateScreenWidth(260),
          // color: Colors.red,
          child: Container(
            child: Stack(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        child: SvgPicture.asset(
                          Vector,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //mainAxisSize: MainAxisAlignment.spaceAround,
                    children: [
                      TextAirbnbCereal(
                        color: Color.fromARGB(255, 0, 0, 0), //4F4F4F
                        fontWeight: FontWeight.w500,
                        size: 20,
                        title: libelle,
                      ),
                      TextAirbnbCereal(
                        color: Color.fromARGB(255, 0, 0, 0), //4F4F4F
                        fontWeight: FontWeight.w400,
                        size: 30,
                        title: '$montant euro',
                      ),
                      TextAirbnbCereal(
                        color: Color.fromARGB(255, 0, 0, 0), //4F4F4F
                        fontWeight: FontWeight.w400,
                        size: 16,
                        title: '$nbre_events évenèments',
                      ),
                      TextAirbnbCereal(
                        color: Color.fromARGB(255, 0, 0, 0), //4F4F4F
                        fontWeight: FontWeight.w400,
                        size: 16,
                        title: '$nbre_jr_pubs jours de publicité',
                      ),
                      InkWell(
                          onTap: () {},
                          child: Button(
                            text: "ACHETER",
                            fontSize: fontSizeminibutton,
                            gradientbackground: gradientbackground,
                            height: heightminibutton,
                            width: widthminibutton,
                            fontWeight: FontWeight.normal,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
