// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../size_config.dart';
import 'image_cached_internet.dart';

class RectangleImage extends StatelessWidget {
  double height;
  double width;
  String image;
  RectangleImage({
    Key? key,
    required this.height,
    required this.width,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: ImageCachedInternet(
        height: getProportionateScreenWidth(height),
        imageUrl: image,
        width: getProportionateScreenWidth(width),
      ),
    );
  }
}
// 'https://admin.saitech-group.com/api_event/public/Images/1671792684.png',
