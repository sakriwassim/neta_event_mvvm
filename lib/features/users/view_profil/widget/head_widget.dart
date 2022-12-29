import 'package:flutter/material.dart';

import '../../../../core/widgets/circle_image.dart';
import '../../../../core/widgets/text_widget_text1.dart';

class HeadWidget extends StatelessWidget {
  double heightimage;
  double widthimage;
  String image;
  String title;
  HeadWidget({
    Key? key,
    required this.widthimage,
    required this.heightimage,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /********** */
        CircleImage(image: image, height: heightimage, width: widthimage),
        SizedBox(
          height: 10,
        ),
        TextAirbnbCereal(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          size: 16,
          title: title,
        ),
      ],
    );
  }
}
