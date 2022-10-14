import 'package:flutter/material.dart';

import '../../view_model_events/one_event_view_model.dart';

class EventCardWidget extends StatelessWidget {
  String? description;
  String? date_heure;
  String? libelle;
  EventCardWidget({
    Key? key,
    required this.events,
    required this.description,
    required this.date_heure,
    required this.libelle,
  }) : super(key: key);

  final List<OneEventViewModel>? events;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(date_heure!,
          style: TextStyle(
              fontFamily: 'AirbnbCereal',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.blue)),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(description!,
              style: TextStyle(
                fontFamily: 'AirbnbCereal',
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.location_pin,
                  size: 20,
                ),
                Text(libelle!,
                    style: TextStyle(
                      fontFamily: 'AirbnbCereal',
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
          ),
        ],
      ),
      leading: Image.asset(
        fit: BoxFit.contain,
        "assets/124.png",
      ),
    );
  }
}
