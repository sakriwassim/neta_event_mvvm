import 'package:shared_preferences/shared_preferences.dart';

import '../models_tickets/add_ticket_model.dart';
import '../models_tickets/ticket_model.dart';
import '../tickets_repositories/tickets_repository.dart';

class TicketsViewModel {
  String title = "Ticket Page ";

  List<TicketModel> listAllTickets = [];

  TicketsRepository? ticketsRepository;
  TicketsViewModel({this.ticketsRepository});

  Future<List<TicketModel>> FetchAllTickets() async {
    listAllTickets = await ticketsRepository!.getAllTickets();
    return listAllTickets;
  }

  Future<TicketModel> GetTicketByID(int id) async {
    var ticketModel = await ticketsRepository!.getTicketByID(id);
    return ticketModel;
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

  Future<List<TicketModel>> GetTicketsUserConnected() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString("userconnectedid");
    var useridint = int.parse(userid!);

    List<TicketModel> list =
        await ticketsRepository!.getTicketsByUser(useridint);
    return list;
  }

  Future<List<TicketModel>> GetTicketsByUser(int id) async {
    List<TicketModel> list = await ticketsRepository!.getTicketsByUser(id);
    return list;
  }
}

/**
 * 


 
 */
