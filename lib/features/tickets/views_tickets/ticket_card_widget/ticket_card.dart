// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/int.dart';
import '../../../../core/size_config.dart';
import '../../../../core/widgets/image_cached_internet.dart';
import '../../../../core/widgets/small_button_style.dart';
import '../../../../core/widgets/text_widget_text1.dart';
import '../../view_model_tickets/one_ticket_view_model.dart';

class TicketCardWidget extends StatelessWidget {
  // "prix": "15000",
  // "QR_code": "qr_code",
  // "date": "19/09/2021",
  // "date_expire": "20/09/2021",
  // "statut": "Valide",
  // "created_at": "2022-12-23T10:19:34.000000Z",
  // "updated_at": "2022-12-23T10:19:34.000000Z"
  String? libelle;
  String? prix;
  String? QR_code;
  String? date_expire;
  String? statut;

  int? id;

  TicketCardWidget({
    Key? key,
    this.libelle,
    this.prix,
    this.QR_code,
    this.date_expire,
    this.statut,
    this.events,
  }) : super(key: key);

  final List<OneTicketViewModel>? events;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
        width: double.infinity,
        height: getProportionateScreenHeight(120), //120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                // Container(
                //   height: double.infinity,
                //   //color: Colors.blue,
                //   child: Padding(
                //     padding: const EdgeInsets.all(5),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(5),
                //       child: ImageCachedInternet(
                //         height: MediaQuery.of(context).size.height,
                //         imageUrl: '$QR_code',
                //         width: getProportionateScreenWidth(60),
                //       ),
                //     ),
                //   ),
                // ),
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
                          title: "$statut",
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
                          title: " participants",
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

                    /*
                    
                      color: backgroundcolor,
        borderRadius: BorderRadius.circular(5.0),
        gradient: gradientbackground,
                    
                     */
                    //color: Color.fromARGB(203, 171, 3, 168),
                    child: Center(
                      child: Text(
                        '$prix',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ), //Text
                  ), //C
                  InkWell(
                    onTap: () {},
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
