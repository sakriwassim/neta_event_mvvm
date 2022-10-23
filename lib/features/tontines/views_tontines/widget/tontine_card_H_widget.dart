import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/widgets/mini_button_style.dart';
import '../../view_model_tickets/one_tontine_view_model.dart';

class TontineCardWidgetH extends StatelessWidget {
  String? image;
  String? libelle;
  String? periode;
  String? nbr_participant;
  String? montant_regulier;
  String? status;
  int? id;
  Function? callbackFunction;

  TontineCardWidgetH({
    Key? key,
    required this.id,
    required this.image,
    required this.libelle,
    required this.periode,
    required this.nbr_participant,
    required this.montant_regulier,
    required this.status,
    required this.events,
    required this.callbackFunction,
  }) : super(key: key);

  final List<OneTontineViewModel>? events;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        margin: const EdgeInsets.only(top: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    "$image",
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("$status",
                            style: const TextStyle(
                                fontFamily: 'AirbnbCereal',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue)),
                        Text("$libelle",
                            style: const TextStyle(
                              fontFamily: 'AirbnbCereal',
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            )),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text("Chaque trimestre",
                                    style: TextStyle(
                                      fontFamily: 'AirbnbCereal',
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text("$nbr_participant participants",
                                    style: const TextStyle(
                                      fontFamily: 'AirbnbCereal',
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(203, 171, 3, 168),
                    radius: 25,
                    child: Text(
                      '$montant_regulier',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ), //Text
                  ), //C
                  InkWell(
                    onTap: () {
                      callbackFunction!(id);
                    },
                    child: MiniButton(text: "Supprimer"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


/**
 *  
 */