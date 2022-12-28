import 'package:flutter/material.dart';

import '../../../../core/widgets/text_widget_text1.dart';

class ColumnOfTestWidget extends StatelessWidget {
  const ColumnOfTestWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextAirbnbCereal(
          title: 'Les étapes à suivre:',
          fontWeight: FontWeight.normal,
          color: Colors.black,
          size: 15,
        ),
        TextAirbnbCereal(
          title: "1- Inserer l'ancien mot de passe",
          fontWeight: FontWeight.normal,
          color: Colors.black,
          size: 15,
        ),
        TextAirbnbCereal(
          title: "2- Inserer le nouveau mot de passe",
          fontWeight: FontWeight.normal,
          color: Colors.black,
          size: 15,
        ),
        TextAirbnbCereal(
          title: "3- Reinserer le nouveau mot de passe",
          fontWeight: FontWeight.normal,
          color: Colors.black,
          size: 15,
        ),
      ],
    );
  }
}
