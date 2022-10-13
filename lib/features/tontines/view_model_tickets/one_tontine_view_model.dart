import '../models_tontines/tontine_model.dart';

class OneTontineViewModel {
  TontineModel? tontineModel;
  OneTontineViewModel({this.tontineModel});
  get id => tontineModel?.id;
  get user_id => tontineModel?.user_id;
  get libelle => tontineModel?.libelle;
  get periode => tontineModel?.periode;
  get nbr_participant => tontineModel?.nbr_participant;
  get montant_regulier => tontineModel?.montant_regulier;
  get status => tontineModel?.status;
  get image => tontineModel?.image;
  get created_at => tontineModel?.created_at;
  get updated_at => tontineModel?.updated_at;
}
