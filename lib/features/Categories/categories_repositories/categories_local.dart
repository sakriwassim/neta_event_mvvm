import '../models_categories/add_categories_model.dart';
import '../models_categories/categories_model.dart';
import 'categories_repository.dart';

class CategoriesLocal extends CategoriesRepository {
  @override
  Future<bool> addCategorie(AddCategorieModel categorieModel) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteCategorieByID(int id) {
    // TODO: implement deleteCategorieByID
    throw UnimplementedError();
  }

  @override
  Future<List<CategorieModel>> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<CategorieModel> getCategorieByID(int id) {
    // TODO: implement getCategorieByID
    throw UnimplementedError();
  }

  @override
  Future<CategorieModel> updateCategorieByID(CategorieModel categorieModel) {
    throw UnimplementedError();
  }
}
