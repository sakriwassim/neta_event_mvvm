import '../models_categories/categories_model.dart';

class OneCategorieViewModel {
  CategorieModel? categorieModel;
  OneCategorieViewModel({this.categorieModel});
  get id => categorieModel?.id;
  get libelle => categorieModel?.libelle;
  get montant => categorieModel?.montantTotal;
  get nbre_events => categorieModel?.nbreEvents;
  get created_at => categorieModel?.createdAt;
  get updated_at => categorieModel?.updatedAt;
  get image => categorieModel?.image;
}
