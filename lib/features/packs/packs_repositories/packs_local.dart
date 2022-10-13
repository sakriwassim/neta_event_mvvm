import '../models_packs/pack_model.dart';
import 'pack_repository.dart';

class PacksLocal extends PacksRepository {
  @override
  Future<List<PackModel>> getAllPacks() {
    // TODO: implement getAllPacks
    throw UnimplementedError();
  }

  @override
  Future<PackModel> getPackByID(int id) {
    // TODO: implement getPackByID
    throw UnimplementedError();
  }

  @override
  Future<PackModel> updatePackByID(PackModel eventModel) {
    throw UnimplementedError();
  }

  @override
  Future<bool> addPack(PackModel packModel) {
    // TODO: implement addPack
    throw UnimplementedError();
  }

  @override
  Future<bool> deletePackByID(int id) {
    // TODO: implement deletePackByID
    throw UnimplementedError();
  }
}
