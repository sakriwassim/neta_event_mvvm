import 'package:flutter/material.dart';

import '../../../../core/size_config.dart';

class CategorieIconWidget extends StatelessWidget {
  String libelle;
  Color backgroundColor;
  CategorieIconWidget(
      {Key? key, required this.libelle, required this.backgroundColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: getProportionateScreenWidth(150),
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(80),
            child: CircleAvatar(
              backgroundColor: backgroundColor,
              child: Image.asset('assets/icon_add_event/Art.png'),
            ),
          ),
          Text(
            libelle,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: 'AirbnbCereal',
                fontSize: 12,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
