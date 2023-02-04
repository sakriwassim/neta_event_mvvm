import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/widgets/text_widget_text1.dart';

class CardGoogle extends StatelessWidget {
  String? image;
  String? title;
  double? height;
  double? width;
  CardGoogle(
      {Key? key,
      required this.image,
      required this.title,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height, //80
        width: width, //300
        child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: SvgPicture.asset("$image"),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 4,
                child: TextAirbnbCereal(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  size: 20,
                  title: "$title",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
