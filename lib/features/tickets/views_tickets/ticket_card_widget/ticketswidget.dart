import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/tickets/views_tickets/ticket_card_widget/ticket_card.dart';

import '../../../../core/size_config.dart';
import '../../models_tickets/ticket_model.dart';

class TicketsWidget extends StatelessWidget {
  List<TicketModel>? tickets;

  TicketsWidget({
    Key? key,
    required this.tickets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getProportionateScreenHeight(300),
        child: Center(
          child: ListView.builder(
              itemCount: tickets?.length,
              itemBuilder: (context, index) => GestureDetector(
                      child: TicketCardWidget(
                    ticket: tickets![index],
                  ))),
        ));
  }
}
