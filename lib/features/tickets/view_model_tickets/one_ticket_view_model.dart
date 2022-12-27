import '../models_tickets/ticket_model.dart';

class OneTicketViewModel {
  TicketModel? ticketModel;
  OneTicketViewModel({this.ticketModel});
  get id => ticketModel?.id;
  get event_id => ticketModel?.event_id;
  get libelle => ticketModel?.libelle;
  get description => ticketModel?.description;
  get prix => ticketModel?.prix;
  get qr_code => ticketModel?.Qr_code;
  get date => ticketModel?.date;
  get statut => ticketModel?.statut;
  get date_expire => ticketModel?.date_expire;
}
