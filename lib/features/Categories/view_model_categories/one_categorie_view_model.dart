import '../models_categories/categories_model.dart';

class OneCategorieViewModel {
  CategorieModel? categorieModel;
  OneCategorieViewModel({this.categorieModel});
  get id => categorieModel?.id;
  get type_pack_id => categorieModel?.type_pack_id;
  get libelle => categorieModel?.libelle;
  get montant => categorieModel?.montant;
  get nbre_events => categorieModel?.nbre_events;
  get nbre_jr_pubs => categorieModel?.nbre_jr_pubs;
  get created_at => categorieModel?.created_at;
  get updated_at => categorieModel?.updated_at;
}
