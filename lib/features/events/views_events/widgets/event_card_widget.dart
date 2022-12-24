import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/size_config.dart';
import '../../../../core/string.dart';
import '../../../../core/widgets/text_widget_text1.dart';
import '../../view_model_events/one_event_view_model.dart';

class EventCardWidgetHome extends StatelessWidget {
  String? description;
  String? date_heure;
  String? libelle;
  String? adresse;
  String? image;
  EventCardWidgetHome({
    Key? key,
    required this.events,
    required this.description,
    required this.date_heure,
    required this.libelle,
    required this.adresse,
    required this.image,
  }) : super(key: key);

  final List<OneEventViewModel>? events;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: getProportionateScreenHeight(150),
      child: Card(
        elevation: 5,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(5)),
              child: Container(
                height: getProportionateScreenHeight(120),
                width: getProportionateScreenWidth(100),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/lod.gif',
                    image: "$image",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(5)),
              child: SizedBox(
                height: getProportionateScreenHeight(93),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextAirbnbCereal(
                      color: const Color.fromARGB(255, 86, 106, 255),
                      fontWeight: FontWeight.w500,
                      size: 12,
                      title: date_heure!,
                    ),
                    TextAirbnbCereal(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                      size: 18,
                      title: libelle!,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(220),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
