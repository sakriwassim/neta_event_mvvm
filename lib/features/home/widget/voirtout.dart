// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/size_config.dart';
import '../../../core/string.dart';
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
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'AirbnbCereal',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
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
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ))),
              SvgPicture.asset(Vector1),
            ],
          )
        ],
      ),
    );
  }
}
