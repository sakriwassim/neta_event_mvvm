import 'package:dartz/dartz.dart';
import 'package:neta_event_mvvm/features/events/models_events/add_event_model.dart';
import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/event_repository.dart';
import 'package:neta_event_mvvm/features/tickets/models_tickets/ticket_model.dart';
import 'package:neta_event_mvvm/features/tickets/tickets_repositories/tickets_repository.dart';

class TicketsLocal extends TicketsRepository {
  @override
  Future<bool> addTicket(TicketModel ticketModel) {
    // TODO: implement addTicket
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTicketByID(int id) {
    // TODO: implement deleteTicketByID
    throw UnimplementedError();
  }

  @override
  Future<List<TicketModel>> getAllTickets() {
    // TODO: implement getAllTickets
    throw UnimplementedError();
  }

  @override
  Future<TicketModel> getTicketByID(int id) {
    // TODO: implement getTicketByID
    throw UnimplementedError();
  }

  @override
  Future<TicketModel> updateTicketByID(TicketModel ticketModel) {
    // TODO: implement updateTicketByID
    throw UnimplementedError();
  }
}
