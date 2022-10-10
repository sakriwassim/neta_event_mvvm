import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/event_repository.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/events_api.dart';

import '../models_tickets/ticket_model.dart';
import '../tickets_repositories/tickets_repository.dart';
import 'one_ticket_view_model.dart';

class TicketsViewModel {
  String title = "Ticket Page ";

  TicketsRepository? ticketsRepository;
  TicketsViewModel({this.ticketsRepository});

  Future<List<OneTicketViewModel>> FetchAllTickets() async {
    List<TicketModel> list = await ticketsRepository!.getAllTickets();
    return list
        .map((listTicket) => OneTicketViewModel(ticketModel: listTicket))
        .toList();
  }

  Future<OneTicketViewModel> GetTicketByID(int id) async {
    var ticketModel = await ticketsRepository!.getTicketByID(id);
    return OneTicketViewModel(ticketModel: ticketModel);
  }

  Future<bool> UpdateTicketByID(TicketModel ticketModel) async {
    var ticket = await ticketsRepository!.updateTicketByID(ticketModel);
    return true;
  }

  Future<bool> AddTicket(TicketModel addTicketModel) async {
    var ticket = await ticketsRepository!.addTicket(addTicketModel);
    return true;
  }

  Future<bool> DeleteTicketByID(int id) async {
    var ticketModel = await ticketsRepository!.deleteTicketByID(id);
    return true;
  }
}
