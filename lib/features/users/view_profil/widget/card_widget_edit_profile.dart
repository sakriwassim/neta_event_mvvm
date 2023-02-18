import 'package:flutter/material.dart';

import '../../../../core/size_config.dart';
import '../../../../core/widgets/text_widget_text1.dart';

class CardWidgetEditprofile extends StatelessWidget {
  Icon icon;
  String text;
  CardWidgetEditprofile({
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(100),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              icon,
              SizedBox(
                width: 20,
              ),
              TextAirbnbCereal(
                color: const Color.fromRGBO(79, 79, 79, 1),
                fontWeight: FontWeight.w500,
                size: 15,
                title: text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
