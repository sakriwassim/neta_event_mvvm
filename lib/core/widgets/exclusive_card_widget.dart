import 'package:flutter/material.dart';

class ExclusiveCardWidget extends StatelessWidget {
  String? adresse;
  String? image;
  String? prix;
  String? libelle;
  ExclusiveCardWidget({
    Key? key,
    required this.adresse,
    required this.image,
    required this.prix,
    required this.libelle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: 2,
      shadowColor: Colors.grey,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image!),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "$libelle",
                style: const TextStyle(
                  fontFamily: 'AirbnbCereal',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.pink, size: 15),
                      Icon(Icons.star, color: Colors.pink, size: 15),
                      Icon(Icons.star, color: Colors.pink, size: 15),
                      Icon(Icons.star, color: Colors.pink, size: 15),
                      Icon(Icons.star, color: Colors.grey, size: 15),
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Text(
                    "Prix :$prix",
                    style: const TextStyle(
                        fontFamily: 'AirbnbCereal',
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined, color: Colors.grey),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    adresse!,
                    style: const TextStyle(
                      fontFamily: 'AirbnbCereal',
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
