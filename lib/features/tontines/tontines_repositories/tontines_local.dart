import 'package:neta_event_mvvm/features/tontines/tontines_repositories/tontines_repository.dart';

import '../models_tontines/tontine_model.dart';

class TontinesLocal extends TontinesRepository {
  @override
  Future<bool> addTontine(TontineModel tontineModel) {
    // TODO: implement addTontine
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTontineByID(int id) {
    // TODO: implement deleteTontineByID
    throw UnimplementedError();
  }

  @override
  Future<List<TontineModel>> getAllTontines() {
    // TODO: implement getAllTontines
    throw UnimplementedError();
  }

  @override
  Future<TontineModel> getTontineByID(int id) {
    // TODO: implement getTontineByID
    throw UnimplementedError();
  }

  @override
  Future<TontineModel> updateTontineByID(TontineModel tontineModel) {
    throw UnimplementedError();
  }
}
