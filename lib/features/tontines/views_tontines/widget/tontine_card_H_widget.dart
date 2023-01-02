import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/widgets/rectangle_image.dart';
import '../../../../core/colors.dart';
import '../../../../core/int.dart';
import '../../../../core/size_config.dart';
import '../../../../core/widgets/image_cached_internet.dart';
import '../../../../core/widgets/small_button_style.dart';
import '../../../../core/widgets/text_widget_text1.dart';
import '../../view_model_tickets/one_tontine_view_model.dart';

class TontineCardWidgetH extends StatelessWidget {
  String? image;
  String? libelle;
  String? periode;
  String? nbr_participant;
  String? montant_regulier;
  String? status;
  int? id;
  Function? callbackFunction;

  TontineCardWidgetH({
    Key? key,
    required this.id,
    required this.image,
    required this.libelle,
    required this.periode,
    required this.nbr_participant,
    required this.montant_regulier,
    required this.status,
    required this.events,
    required this.callbackFunction,
  }) : super(key: key);

  final List<OneTontineViewModel>? events;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //horizontal: getProportionateScreenHeight(5),
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(5),
          vertical: getProportionateScreenWidth(5)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
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
        height: getProportionateScreenHeight(120),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                RectangleImage(
                  height: 120,
                  image: '$image',
                  width: 120,
                ),
                SizedBox(width: getProportionateScreenWidth(10)),
                SizedBox(
                  // height: 150,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextAirbnbCereal(
                          color: Color.fromRGBO(226, 133, 65, 1),
                          fontWeight: FontWeight.w500,
                          size: 8,
                          title: "$status",
                        ),
                        TextAirbnbCereal(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                          size: 8,
                          title: "$libelle",
                        ),
                        TextAirbnbCereal(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          size: 13,
                          title: "Chaque trimestre",
                        ),
                        TextAirbnbCereal(
                          color: Color.fromRGBO(79, 79, 79, 1),
                          fontWeight: FontWeight.w500,
                          size: 15,
                          title: "$nbr_participant participants",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(203, 171, 3, 168),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: getProportionateScreenHeight(30), // 30,
                    width: getProportionateScreenWidth(60), //60,

                    child: Center(
                      child: Text(
                        '$montant_regulier',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ), //Text
                  ), //C
                  InkWell(
                    onTap: () {
                      callbackFunction!(id);
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
