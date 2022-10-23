import 'package:flutter/material.dart';

class CategorieCardWidget extends StatelessWidget {
  String libelle;
  CategorieCardWidget({Key? key, required this.libelle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/123.png'),
          Text(
            libelle,
            style:const TextStyle(
                color: Colors.white,
                fontFamily: 'AirbnbCereal',
                fontSize: 20,
                fontWeight: FontWeight.w500) ,
          )
        ],
      ),
    );
  }
}
