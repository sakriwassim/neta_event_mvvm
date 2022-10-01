import 'package:neta_event_mvvm/models/event_model.dart';

class OneEventViewModel {
  EventModel? eventModel;
  OneEventViewModel({this.eventModel});

  get id => eventModel?.id;
  get libelle => eventModel?.libelle;
  get description => eventModel?.description;
  get prix => eventModel?.prix;
  get adresse => eventModel?.adresse;
  get image => eventModel?.image;
}
