import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/tickets/views_tickets/ticket_card_widget/ticket_card.dart';

import '../../../events/evants_repositories/events_api.dart';
import '../../../events/view_model_events/events_view_model.dart';
import '../../tickets_repositories/tickets_api.dart';
import '../../view_model_tickets/tickets_view_model.dart';
import '../one_ticket_view.dart';

class GetAllTicketWidget extends StatefulWidget {
  GetAllTicketWidget({super.key});

  @override
  State<GetAllTicketWidget> createState() => _GetAllTicketWidgetState();
}

class _GetAllTicketWidgetState extends State<GetAllTicketWidget> {
  var data = TicketsViewModel(ticketsRepository: TicketsApi());
  var dataEvents = EventsViewModel(eventsRepository: EventsApi());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.maxFinite,
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            data.FetchAllTickets();
          });

          return Future.delayed(const Duration(seconds: 2));
        },
        child: Container(
          // color: Colors.blue,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: FutureBuilder(
              future: data.FetchAllTickets(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  var tickets = snapshot.data;
                  return ListView.builder(
                      itemCount: tickets?.length,
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OnTicketView(
                                          id: tickets![index].id,
                                          // image: tickets[index].image,
                                        )));
                          },
                          child: TicketCardWidget(
                            event_id: '${tickets![index].event_id}',
                            QR_code: '${tickets![index].qr_code}',
                            date_expire: '${tickets![index].date}',
                            libelle: '${tickets![index].libelle}',
                            prix: '${tickets![index].prix}',
                            statut: '${tickets![index].statut}',
                          )));
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}
