import 'package:flutter/material.dart';

class CategorieIconWidget extends StatelessWidget {
  String libelle;
  Color backgroundColor;
  CategorieIconWidget(
      {Key? key, required this.libelle, required this.backgroundColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: CircleAvatar(
              backgroundColor: backgroundColor,
              child: Image.asset('assets/icon_add_event/Art.png'),
            ),
          ),
          Text(
            libelle,
            style:const TextStyle(
                color: Colors.black,
                fontFamily: 'AirbnbCereal',
                fontSize: 20,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
