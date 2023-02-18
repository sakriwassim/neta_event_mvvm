import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/tickets/views_tickets/ticket_card_widget/ticket_card.dart';
import 'package:provider/provider.dart';
import '../../../../core/size_config.dart';
import '../../models_tickets/ticket_model.dart';
import '../../view_model_tickets/tickets_view_model.dart';

class GetAllTicketWidget extends StatefulWidget {
  List<TicketModel> tickets;

  GetAllTicketWidget({required this.tickets, super.key});

  @override
  State<GetAllTicketWidget> createState() => _GetAllTicketWidgetState();
}

class _GetAllTicketWidgetState extends State<GetAllTicketWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: ListView.builder(
                itemCount: widget.tickets.length,
                itemBuilder: (context, index) {
                  return TicketCardWidget(
                    ticketModel: widget.tickets[index],
                  );
                })));
  }
}
