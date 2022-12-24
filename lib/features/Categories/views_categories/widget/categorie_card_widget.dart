import 'package:flutter/material.dart';

import '../../../../core/size_config.dart';
import '../../../../core/widgets/text_widget_text1.dart';

class CategorieCardWidget extends StatelessWidget {
  String libelle;
  String image;
  CategorieCardWidget({Key? key, required this.libelle, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenWidth(10)),
      child: Container(
        //color: Colors.blue,
        width: getProportionateScreenWidth(150),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/lod.gif',
                  image: "$image",
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(10),
                      horizontal: getProportionateScreenWidth(10)),
                  child: TextAirbnbCereal(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    size: 14,
                    title: libelle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
