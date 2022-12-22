import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/colors.dart';
import '../../../../core/size_config.dart';
import '../../../../core/string.dart';
import '../../../../core/widgets/text_widget_text1.dart';
import '../../view_model_events/one_event_view_model.dart';

class EventCardWidget extends StatelessWidget {
  String? description;
  String? date_heure;
  String? libelle;
  String? prix;
  String? adresse;
  EventCardWidget({
    Key? key,
    required this.events,
    required this.description,
    required this.date_heure,
    required this.libelle,
    required this.prix,
    required this.adresse,
  }) : super(key: key);

  final List<OneEventViewModel>? events;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: getProportionateScreenHeight(150),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: getProportionateScreenHeight(120),
                      // width: getProportionateScreenWidth(),
                      child: Center(
                        child: Image.network(
                            "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(93),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            date_heure!,
                            style: TextStyle(
                              fontFamily: 'AirbnbCereal',
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0,
                              foreground: Paint()..shader = linearGradient,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          TextAirbnbCereal(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                            size: 18,
                            title: libelle!,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          TextAirbnbCereal(
                            color: Color.fromRGBO(79, 79, 79, 1),
                            fontWeight: FontWeight.w500,
                            size: 12,
                            title: "prix : ",
                          ),
                          TextAirbnbCereal(
                            color: Color.fromRGBO(79, 79, 79, 1),
                            fontWeight: FontWeight.w500,
                            size: 12,
                            title: prix!,
                          ),
                          TextAirbnbCereal(
                            color: Color.fromRGBO(79, 79, 79, 1),
                            fontWeight: FontWeight.w500,
                            size: 12,
                            title: "€",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      )
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
