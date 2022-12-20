import 'package:flutter/material.dart';
import '../../view_model_events/one_event_view_model.dart';

class EventCardWidget extends StatelessWidget {
  String? description;
  String? date_heure;
  String? libelle;
  String? prix;
  String? adresse;
  EventCardWidget({
    Key? key,
    required this.events,
    required this.description,
    required this.date_heure,
    required this.libelle,
    required this.prix,
    required this.adresse,
  }) : super(key: key);

  final List<OneEventViewModel>? events;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Row(
          children: [
            //Padding(
            // padding: const EdgeInsets.all(0.0),
            // child:
            // Image.asset(
            //   "assets/124.png",
            // ),
            // ),
            Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      width: 220,
                      child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
