import 'package:neta_event_mvvm/features/tontines/tontines_repositories/tontines_repository.dart';

import '../models_tontines/tontine_model.dart';

class TontinesLocal extends TontinesRepository {
  @override
  Future<bool> addTontine(TontineModel tontineModel) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTontineByID(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<TontineModel>> getAllTontines() {
  
    throw UnimplementedError();
  }

  @override
  Future<TontineModel> getTontineByID(int id) {
    throw UnimplementedError();
  }

  @override
  Future<TontineModel> updateTontineByID(TontineModel tontineModel) {
    throw UnimplementedError();
  }
}
