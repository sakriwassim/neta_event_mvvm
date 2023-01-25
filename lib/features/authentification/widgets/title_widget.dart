import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/size_config.dart';
import '../../../core/string.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../view_model_authentification/authentification_view_model.dart';

class TitleWidget extends StatelessWidget {
  bool isLogin;
  TitleWidget({required this.isLogin, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15)),
              child: TextAirbnbCereal(
                title: isLogin ? 'Se connecter' : "S'inscrire",
                fontWeight: FontWeight.w500,
                color: Colors.black,
                size: 24,
              ),
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
      ],
    );
  }
}
