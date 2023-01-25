
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/size_config.dart';
import '../../../core/string.dart';

class Headsigin extends StatelessWidget {
  const Headsigin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          splashScreen1,
          height: getProportionateScreenHeight(50),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        SvgPicture.asset(
          splashScreen2,
          height: getProportionateScreenHeight(15),
        ),
      ],
    );
  }
}