import 'package:flutter/material.dart';

import '../models_tontines/tontine_model.dart';
import '../tontines_repositories/tontines_api.dart';

class TontinesViewModel extends ChangeNotifier {
  String title = "Tontine Page ";
  List<TontineModel> tontines = [];
  TontineModel? tontineById;
  bool? loading = false;

  Future<void> FetchAllTontines() async {
    loading = true;
    tontines = await TontinesApi().getAllTontines();
    notifyListeners();
    loading = false;
    notifyListeners();
  }

  Future<void> GetTontineByID(int id) async {
    var ticketModel = await TontinesApi().getTontineByID(id);
    tontineById = TontineModel();
  }

  Future<void> UpdateTontineByID(TontineModel addTontineModel) async {
    var responce = await TontinesApi().updateTontineByID(addTontineModel);
  }

  Future<void> AddTontine(TontineModel addTontineModel) async {
    loading = true;
    var event = await TontinesApi().addTontine(addTontineModel);
    notifyListeners();
    loading = false;
    notifyListeners();
  }

  Future<bool> DeleteTontineByID(int id) async {
    var ticketModel = await TontinesApi().deleteTontineByID(id);
    return true;
  }
}
