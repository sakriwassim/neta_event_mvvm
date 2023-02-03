import 'package:flutter/cupertino.dart';
import 'package:neta_event_mvvm/features/tickets/tickets_repositories/tickets_api.dart';

import '../models_tickets/add_ticket_model.dart';
import '../models_tickets/ticket_model.dart';

class TicketsViewModel extends ChangeNotifier {
  String title = "Ticket Page ";
  List<TicketModel> alltickets = [];
  TicketModel? ticketById;

  Future<void> FetchAllTickets() async {
    List<TicketModel> alltickets = await TicketsApi().getAllTickets();
  }

  Future<void> GetTicketByID(int id) async {
    var ticketById = await TicketsApi().getTicketByID(id);
  }

  Future<bool> UpdateTicketByID(AddTicketModel addTicketModel) async {
    var ticket = await TicketsApi().updateTicketByID(addTicketModel);
    return true;
  }

  Future<bool> AddTicket(AddTicketModel addTicketModel) async {
    var event = await TicketsApi().addTicket(addTicketModel);
    return true;
  }

  Future<bool> DeleteTicketByID(int id) async {
    var ticketModel = await TicketsApi().deleteTicketByID(id);
    return true;
  }
}
