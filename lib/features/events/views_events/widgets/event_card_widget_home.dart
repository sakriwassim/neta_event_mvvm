import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/colors.dart';
import '../../../../core/size_config.dart';

import '../../../../core/widgets/image_cached_internet.dart';
import '../../../../core/widgets/text_widget_text1.dart';

class EventCardWidget extends StatelessWidget {
  String? description;
  String? date_heure;
  String? libelle;
  String? prix;
  String? adresse;
  String? image;
  EventCardWidget({
    Key? key,
    required this.description,
    required this.date_heure,
    required this.libelle,
    required this.prix,
    required this.adresse,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: getProportionateScreenHeight(150),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      width: getProportionateScreenHeight(100),
                      height: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: ImageCachedInternet(
                          height: MediaQuery.of(context).size.height,
                          imageUrl: '$image',
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
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
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                          size: 18,
                          title: libelle!,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      TextAirbnbCereal(
                        color: const Color.fromRGBO(79, 79, 79, 1),
                        fontWeight: FontWeight.w500,
                        size: 12,
                        title: "prix : ",
                      ),
                      TextAirbnbCereal(
                        color: const Color.fromRGBO(79, 79, 79, 1),
                        fontWeight: FontWeight.w500,
                        size: 12,
                        title: prix!,
                      ),
                      TextAirbnbCereal(
                        color: const Color.fromRGBO(79, 79, 79, 1),
                        fontWeight: FontWeight.w500,
                        size: 12,
                        title: " fcfa",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
