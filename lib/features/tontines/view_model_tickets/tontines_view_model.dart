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

  Future<bool> UpdateTontineByID(TontineModel addTontineModel) async {
    var ticket = await TontinesApi().updateTontineByID(addTontineModel);
    return true;
  }

  Future<bool> AddTontine(TontineModel addTontineModel) async {
    var event = await TontinesApi().addTontine(addTontineModel);
    return true;
  }

  Future<bool> DeleteTontineByID(int id) async {
    var ticketModel = await TontinesApi().deleteTontineByID(id);
    return true;
  }
}
