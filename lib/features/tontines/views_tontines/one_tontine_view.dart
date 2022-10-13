import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/one_event_view_model.dart';

import '../tontines_repositories/tontines_api.dart';
import '../view_model_tickets/one_tontine_view_model.dart';
import '../view_model_tickets/tontines_view_model.dart';

class OnTontineView extends StatefulWidget {
  const OnTontineView({super.key});

  @override
  State<OnTontineView> createState() => _OnTontineViewState();
}

class _OnTontineViewState extends State<OnTontineView> {
  var data = TontinesViewModel(ticketsRepository: TontinesApi());
  //var api = EventsApi().getEventByID(2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.title)),
      body: Center(
        child: FutureBuilder<OneTontineViewModel>(
          future: data.GetTontineByID(2),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.libelle);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          }),
        ),
      ),
    );
  }
}
