import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        child: Container(
          child: Row(
            children: [
              Container(
                height: getProportionateScreenHeight(120),
                width: getProportionateScreenWidth(100),
                child: Center(
                  child: Image.network(
                      "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                ),
              ),
              Container(
                height: getProportionateScreenHeight(93),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextAirbnbCereal(
                      color: Color.fromARGB(255, 86, 106, 255),
                      fontWeight: FontWeight.w500,
                      size: 12,
                      title: date_heure!,
                    ),
                    TextAirbnbCereal(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                      size: 18,
                      title: libelle!,
                    ),
                    Container(
                      width: 220,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                SvgPicture.asset(Location),
                                TextAirbnbCereal(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  size: 12,
                                  title: adresse!,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
