import 'package:flutter/material.dart';
import '../../events/view_model_events/one_event_view_model.dart';

class EventCardGrindWidget extends StatelessWidget {
  String? description;
  String? date_heure;
  String? libelle;
  String? prix;
  String? adresse;
  EventCardGrindWidget({
    Key? key,
    required this.description,
    required this.date_heure,
    required this.libelle,
    required this.prix,
    required this.adresse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      height: 150,
      width: 100,
      child: Column(
        children: [
          Container(
            height: 50,
            color: Colors.green,
            child: Image.asset(
              "assets/124.png",
            ),
          ),
          Container(
            height: 50,
            color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date_heure!,
                    style: TextStyle(
                        fontFamily: 'AirbnbCereal',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue)),
                Text(libelle!,
                    style: TextStyle(
                      fontFamily: 'AirbnbCereal',
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              size: 20,
                            ),
                            Text(adresse!,
                                style: TextStyle(
                                  fontFamily: 'AirbnbCereal',
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        child: Text(prix!,
                            style: TextStyle(
                              fontFamily: 'AirbnbCereal',
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
