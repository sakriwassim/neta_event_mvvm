import 'package:flutter/cupertino.dart';
import 'package:neta_event_mvvm/features/tickets/tickets_repositories/tickets_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models_tickets/add_ticket_model.dart';
import '../models_tickets/ticket_model.dart';

class TicketsViewModel extends ChangeNotifier {
  String title = "Ticket Page ";

  List<TicketModel> listAllTickets = [];
  List<TicketModel> getTicketsUserConnected = [];
  List<TicketModel> getTicketsByUser = [];

  Future<void> FetchAllTickets() async {
    listAllTickets = await TicketsApi().getAllTickets();
    notifyListeners();
  }

  Future<void> GetTicketByID(int id) async {
    var ticketModel = await TicketsApi().getTicketByID(id);
    notifyListeners();
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

  Future<void> GetTicketsUserConnected() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString("userconnectedid");
    var useridint = int.parse(userid!);

    List<TicketModel> getTicketsUserConnected =
        await TicketsApi().getTicketsByUser(useridint);

    notifyListeners();
  }

  Future<void> GetTicketsByUser(int id) async {
    List<TicketModel> getTicketsByUser =
        await TicketsApi().getTicketsByUser(id);

    notifyListeners();
  }
}
