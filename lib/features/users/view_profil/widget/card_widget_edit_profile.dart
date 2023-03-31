import 'package:flutter/material.dart';

import '../../../../core/size_config.dart';
import '../../../../core/widgets/text_widget_text1.dart';

class CardWidgetEditprofile extends StatelessWidget {
  Icon icon;
  String text;
  double width;
  double height;
  final void Function()? onTap;
  CardWidgetEditprofile({
    required this.icon,
    required this.text,
    required this.width,
    required this.height,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
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
      ),
    );
  }
}
