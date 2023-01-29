import 'package:flutter/material.dart';

import '../models_tontines/tontine_model.dart';
import '../tontines_repositories/tontines_api.dart';
import 'one_tontine_view_model.dart';

class TontinesViewModel extends ChangeNotifier {
  String title = "Tontine Page ";
  List<OneTontineViewModel> tontines = [];

  Future<void> FetchAllTontines() async {
    List<TontineModel> list = await TontinesApi().getAllTontines();
    tontines = list
        .map((listTontine) => OneTontineViewModel(tontineModel: listTontine))
        .toList();
    notifyListeners();
  }

  Future<OneTontineViewModel> GetTontineByID(int id) async {
    var ticketModel = await TontinesApi().getTontineByID(id);
    return OneTontineViewModel(tontineModel: ticketModel);
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
