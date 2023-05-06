import '../models_packs/pack_model.dart';

class OnePackViewModel {
  PackModel? packModel;
  OnePackViewModel({this.packModel});

  get id => packModel?.id;
  get libelle => packModel?.libelle;
  get created_at => packModel?.createdAt;
  get updated_at => packModel?.updatedAt;
  get montant => packModel?.montant;
  get nbre_events => packModel?.nbreEvents;
  get nbre_jr_pubs => packModel?.nbreJrPubs;
}
