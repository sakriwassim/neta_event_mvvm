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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(10),
        ),
        child: Container(
          width: getProportionateScreenWidth(220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: getProportionateScreenWidth(210),
                  height: getProportionateScreenHeight(130),
                  color: Colors.blue,
                  child: Image.asset(image!)),
              SizedBox(
                height: getProportionateScreenHeight(6),
              ),
              Row(
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
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Container(
                color: Colors.black54,
                width: getProportionateScreenWidth(210),
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
              Row(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
