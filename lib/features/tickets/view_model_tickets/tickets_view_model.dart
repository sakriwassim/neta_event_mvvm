
import '../models_tickets/add_ticket_model.dart';
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

  Future<bool> UpdateTicketByID(AddTicketModel addTicketModel) async {
    var ticket = await ticketsRepository!.updateTicketByID(addTicketModel);
    return true;
  }

  Future<bool> AddTicket(AddTicketModel addTicketModel) async {
    var event = await ticketsRepository!.addTicket(addTicketModel);
    return true;
  }

  Future<bool> DeleteTicketByID(int id) async {
    var ticketModel = await ticketsRepository!.deleteTicketByID(id);
    return true;
  }
}
