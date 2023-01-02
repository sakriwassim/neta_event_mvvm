import 'package:flutter/material.dart';
import 'package:flutter_custom_tab_bar/library.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/int.dart';

import '../../../core/colors.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: getProportionateScreenWidth(200),
        height: getProportionateScreenHeight(300),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
//            color: Colors.green,
          height: double.infinity,
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: SvgPicture.asset(
                      Vector,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //mainAxisSize: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      //color: Color.fromARGB(255, 173, 2, 225),
                      child: TextAirbnbCereal(
                        color: Color.fromARGB(255, 0, 0, 0), //4F4F4F
                        fontWeight: FontWeight.w500,
                        size: 20,
                        title: libelle,
                      ),
                    ),
                    TextAirbnbCereal(
                      color: Color.fromARGB(255, 0, 0, 0), //4F4F4F
                      fontWeight: FontWeight.w400,
                      size: 30,
                      title: '$montant fcfa',
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
                    InkWell(
                        onTap: () {},
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
