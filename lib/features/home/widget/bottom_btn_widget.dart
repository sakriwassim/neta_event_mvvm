import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/colors.dart';
import '../../../core/size_config.dart';

class bottomBtnwidget extends StatelessWidget {
  int? Index;

  int? currentIndex;
  String? text;
  String? iconoff;
  String? iconon;

  bottomBtnwidget({
    Key? key,
    required this.currentIndex,
    required this.text,
    required this.iconoff,
    required this.iconon,
    required this.Index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: getProportionateScreenHeight(27),
          child: SvgPicture.asset(
            currentIndex == Index ? "$iconon" : "$iconoff",
            width: getProportionateScreenWidth(28),
          ),
        ),
        Text(
          '$text',
          style: TextStyle(
            foreground: currentIndex == Index
                ? (Paint()..shader = linearGradient)
                : Paint()
              ..color = Colors.grey,
            fontFamily: 'AirbnbCereal',
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
          ),
        )
      ],
    );
  }
}
