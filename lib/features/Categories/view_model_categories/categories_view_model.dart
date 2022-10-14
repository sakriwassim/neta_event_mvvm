
import '../models_categories/add_categories_model.dart';
import '../models_categories/categories_model.dart';
import '../categories_repositories/categories_repository.dart';
import 'one_categorie_view_model.dart';

class CategoriesViewModel {
  String title = "Categorie Page ";

  CategoriesRepository? ticketsRepository;
  CategoriesViewModel({this.ticketsRepository});

  Future<List<OneCategorieViewModel>> FetchAllCategories() async {
    List<CategorieModel> list = await ticketsRepository!.getAllCategories();
    return list
        .map((listCategorie) => OneCategorieViewModel(categorieModel: listCategorie))
        .toList();
  }

  Future<OneCategorieViewModel> GetCategorieByID(int id) async {
    var ticketModel = await ticketsRepository!.getCategorieByID(id);
    return OneCategorieViewModel(categorieModel: ticketModel);
  }

  Future<bool> UpdateCategorieByID(CategorieModel addCategorieModel) async {
    var ticket = await ticketsRepository!.updateCategorieByID(addCategorieModel);
    return true;
  }

  Future<bool> AddCategorie(AddCategorieModel addCategorieModel) async {
    var event = await ticketsRepository!.addCategorie(addCategorieModel);
    return true;
  }

  Future<bool> DeleteCategorieByID(int id) async {
    var ticketModel = await ticketsRepository!.deleteCategorieByID(id);
    return true;
  }
}
