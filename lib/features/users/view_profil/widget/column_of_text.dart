
import 'package:flutter/material.dart';

import '../../../../core/widgets/text_widget_text2.dart';

class ColumnOfTestWidget extends StatelessWidget {
  const ColumnOfTestWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
            title: 'Les étapes à suivre:',
            fontSize: 15),
        TextWidget(
            title:
                "1- Inserer l'ancien mot de passe",
            fontSize: 15),
        TextWidget(
            title:
                "2- Inserer le nouveau mot de passe",
            fontSize: 15),
        TextWidget(
            title:
                "3- Reinserer le nouveau mot de passe",
            fontSize: 15),
      ],
    );
  }
}
