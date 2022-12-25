import 'package:flutter/material.dart';

import 'text_widget_text1.dart';

class AppBarDetails extends StatelessWidget {
  String title;
  String image;
  AppBarDetails({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // elevation: 0.0,
      shadowColor: Colors.white,
      title: TextAirbnbCereal(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        size: 24,
        title: title, //'Tontine details',
      ),
      // iconTheme: SvgPicture.asset(arrowleft),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/lod.gif',
          image: "${image}",
          fit: BoxFit.fill,
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
