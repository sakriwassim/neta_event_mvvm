import 'package:dartz/dartz.dart';
import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';

import '../models_tickets/ticket_model.dart';

abstract class TicketsRepository {
  Future<List<TicketModel>> getAllTickets();
  Future<TicketModel> getTicketByID(int id);
  Future<TicketModel> updateTicketByID(TicketModel ticketModel);
  Future<bool> addTicket(TicketModel ticketModel);
  Future<bool> deleteTicketByID(int id);
}
