import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/widgets/text_widget_text1.dart';

import '../size_config.dart';
import '../string.dart';

class ExclusiveCardWidget extends StatelessWidget {
  String? adresse;
  String? image;
  String? prix;
  String? libelle;
  ExclusiveCardWidget({
    Key? key,
    required this.adresse,
    required this.image,
    required this.prix,
    required this.libelle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: 3,
      shadowColor: Colors.grey,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            //color: Colors.white,
            child: SizedBox(
              width: getProportionateScreenWidth(220),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: getProportionateScreenHeight(130),
                    decoration: const BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/lod.gif',
                        image: "$image",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(6),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextAirbnbCereal(
                          color: Color.fromARGB(255, 0, 0, 0), //4F4F4F
                          fontWeight: FontWeight.w500,
                          size: 18,
                          title: libelle!,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  Container(
                    //color: Colors.black54,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.pink, size: 15),
                            Icon(Icons.star, color: Colors.pink, size: 15),
                            Icon(Icons.star, color: Colors.pink, size: 15),
                            Icon(Icons.star, color: Colors.pink, size: 15),
                            Icon(Icons.star, color: Colors.grey, size: 15),
                          ],
                        ),
                        TextAirbnbCereal(
                          color: Color(0xff4F4F4F), //4F4F4F
                          fontWeight: FontWeight.w500,
                          size: 12,
                          title: 'Prix :$prix fcfa',
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        SvgPicture.asset(Locationcard),
                        SizedBox(
                          width: getProportionateScreenWidth(5),
                        ),
                        TextAirbnbCereal(
                          color: Color(0xFF2B2849), //4F4F4F
                          fontWeight: FontWeight.w500,
                          size: 12,
                          title: adresse!,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(5),
              vertical: getProportionateScreenWidth(5),
            ),
            child: SizedBox(
              width: getProportionateScreenWidth(220),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    favori,
                    height: 40,
                  ),
                  Container(
                    height: getProportionateScreenHeight(40),
                    width: getProportionateScreenWidth(40),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                        Center(
                          child: TextAirbnbCereal(
                            color: Color(0xFF2B2849), //4F4F4F
                            fontWeight: FontWeight.w500,
                            size: 20,
                            title: "10",
                          ),
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
    );
  }
}
