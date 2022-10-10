import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';

class OneEventViewModel {
  EventModel? eventModel;
  OneEventViewModel({this.eventModel});

  

  get id => eventModel?.id;
  get category_id => eventModel?.categoryId;
  get observation_id => eventModel?.observationId;
  get libelle => eventModel?.libelle;
  get description => eventModel?.description;
  get prix => eventModel?.prix;
  get date_heure => eventModel?.dateHeure;
  get adresse => eventModel?.adresse;
  get nbre_tichet => eventModel?.nbreTichet;
  get status => eventModel?.status;
  get image => eventModel?.image;
  get created_at => eventModel?.categoryId;
  get updated_at => eventModel?.updatedAt;
}
