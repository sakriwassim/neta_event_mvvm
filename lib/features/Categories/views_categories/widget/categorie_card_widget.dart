import 'package:flutter/material.dart';

import '../../../../core/size_config.dart';
import '../../../../core/widgets/text_widget_text1.dart';

class CategorieCardWidget extends StatelessWidget {
  String libelle;
  CategorieCardWidget({Key? key, required this.libelle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // color: Colors.blue,
        width: getProportionateScreenWidth(150),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/123.png'),
            TextAirbnbCereal(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              size: 14,
              title: libelle,
            ),
          ],
        ),
      ),
    );
  }
}
