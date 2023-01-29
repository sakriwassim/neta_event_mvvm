import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/Categories/categories_repositories/categories_api.dart';

import '../models_categories/add_categories_model.dart';
import '../models_categories/categories_model.dart';
import 'one_categorie_view_model.dart';

class CategoriesViewModel extends ChangeNotifier {
  String title = "Categorie Page ";
  List<OneCategorieViewModel> categories = [];

  Future<void> FetchAllCategories() async {
    List<CategorieModel> list = await CategoriesApi().getAllCategories();
    categories = list
        .map((listCategorie) =>
            OneCategorieViewModel(categorieModel: listCategorie))
        .toList();
    notifyListeners();
   
  }

  Future<OneCategorieViewModel> GetCategorieByID(int id) async {
    var ticketModel = await CategoriesApi().getCategorieByID(id);
    return OneCategorieViewModel(categorieModel: ticketModel);
  }

  Future<bool> UpdateCategorieByID(CategorieModel addCategorieModel) async {
    var ticket = await CategoriesApi().updateCategorieByID(addCategorieModel);
    return true;
  }

  Future<bool> AddCategorie(AddCategorieModel addCategorieModel) async {
    var event = await CategoriesApi().addCategorie(addCategorieModel);
    return true;
  }

  Future<bool> DeleteCategorieByID(int id) async {
    var ticketModel = await CategoriesApi().deleteCategorieByID(id);
    return true;
  }
}
