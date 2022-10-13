import '../models_packs/pack_model.dart';

abstract class PacksRepository {
  Future<List<PackModel>> getAllPacks();
  Future<PackModel> getPackByID(int id);
  Future<PackModel> updatePackByID(PackModel packModel);
  Future<bool> addPack(PackModel packModel);
  Future<bool> deletePackByID(int id);
}
