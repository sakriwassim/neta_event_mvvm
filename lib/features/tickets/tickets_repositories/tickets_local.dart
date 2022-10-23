import 'package:neta_event_mvvm/features/tickets/models_tickets/ticket_model.dart';
import 'package:neta_event_mvvm/features/tickets/tickets_repositories/tickets_repository.dart';

import '../models_tickets/add_ticket_model.dart';

class TicketsLocal extends TicketsRepository {
  @override
  Future<bool> addTicket(AddTicketModel addTicketModel) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTicketByID(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<TicketModel>> getAllTickets() {
    throw UnimplementedError();
  }

  @override
  Future<TicketModel> getTicketByID(int id) {
    throw UnimplementedError();
  }

  @override
  Future<AddTicketModel> updateTicketByID(AddTicketModel addTicketModel) {
    throw UnimplementedError();
  }
}
