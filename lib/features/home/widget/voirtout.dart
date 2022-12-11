// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../Categories/views_categories/categories_view.dart';

class VoirTout extends StatelessWidget {
  String text;
  Function callbackfonction;
  VoirTout({
    Key? key,
    required this.text,
    required this.callbackfonction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Text(text,
              style: TextStyle(
                fontFamily: 'AirbnbCereal',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )),
          const Spacer(),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    callbackfonction();
                  },
                  child: const Text("Voir tout",
                      style: TextStyle(
                        fontFamily: 'AirbnbCereal',
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ))),
              const SizedBox(
                width: 4,
              ),
              const Icon(
                Icons.forward_outlined,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }
}
