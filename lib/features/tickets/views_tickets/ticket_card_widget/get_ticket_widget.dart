import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/tickets/views_tickets/ticket_card_widget/ticket_card.dart';
import 'package:provider/provider.dart';
import '../../../../core/colors.dart';
import '../../../../core/int.dart';
import '../../../../core/size_config.dart';
import '../../../../core/widgets/rectangle_image.dart';
import '../../../../core/widgets/small_button_style.dart';
import '../../../events/view_model_events/events_view_model.dart';
import '../../models_tickets/ticket_model.dart';
import '../../view_model_tickets/tickets_view_model.dart';

class GetAllTicketWidget extends StatefulWidget {
  const GetAllTicketWidget({super.key});

  @override
  State<GetAllTicketWidget> createState() => _GetAllTicketWidgetState();
}

class _GetAllTicketWidgetState extends State<GetAllTicketWidget> {
  var tickets = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<TicketsViewModel>(context, listen: false).FetchAllTickets();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ticketprovider = Provider.of<TicketsViewModel>(context, listen: true);
    if (ticketprovider != null) {
      tickets = ticketprovider.listAllTickets!;
    }

    SizeConfig().init(context);
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: ticketprovider.loading == true
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: tickets.length,
                    itemBuilder: (context, index) {
                      return TicketCardWidget(
                        ticketModel: tickets[index],
                      );
                    })));
  }
}
