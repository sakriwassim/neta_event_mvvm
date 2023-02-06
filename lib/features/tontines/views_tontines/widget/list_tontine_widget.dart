import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/tontines/views_tontines/widget/tontine_card_H_widget.dart';

import '../../models_tontines/tontine_model.dart';
import '../../view_model_tickets/tontines_view_model.dart';
import '../one_tontine_view.dart';

class ListTontineWidget extends StatelessWidget {
  const ListTontineWidget({
    Key? key,
    required this.tontines,
  }) : super(key: key);

  final List<TontineModel> tontines;

  @override
  Widget build(BuildContext context) {
    return tontines.isEmpty
        ? Center(
            child: Text("no tontines"),
          )
        : ListView.builder(
            itemCount: tontines.length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnTontineView(
                                tontine: tontines[index],
                              )));
                },
                child: TontineCardWidgetH(
                  tontine: tontines[index],
                )));
  }
}
