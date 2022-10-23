
import '../models_tontines/tontine_model.dart';

abstract class TontinesRepository {
  Future<List<TontineModel>> getAllTontines();
  Future<TontineModel> getTontineByID(int id);
  Future<TontineModel> updateTontineByID(TontineModel tontineModel);
  Future<bool> addTontine(TontineModel tontineModel);
  Future<bool> deleteTontineByID(int id);
}
