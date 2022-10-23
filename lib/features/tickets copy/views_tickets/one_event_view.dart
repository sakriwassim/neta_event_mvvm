import 'package:flutter/material.dart';

import '../../tickets/tickets_repositories/tickets_api.dart';
import '../../tickets/view_model_tickets/one_ticket_view_model.dart';
import '../../tickets/view_model_tickets/tickets_view_model.dart';

class OnTicketView extends StatefulWidget {
  const OnTicketView({super.key});

  @override
  State<OnTicketView> createState() => _OnTicketViewState();
}

class _OnTicketViewState extends State<OnTicketView> {
  var data = TicketsViewModel(ticketsRepository: TicketsApi());
  //var api = EventsApi().getEventByID(2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.title)),
      body: Center(
        child: FutureBuilder<OneTicketViewModel>(
          future: data.GetTicketByID(2),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.description);
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
