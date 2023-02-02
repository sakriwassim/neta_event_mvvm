import 'package:flutter/material.dart';

import '../models_tontines/tontine_model.dart';
import '../tontines_repositories/tontines_api.dart';

class TontinesViewModel extends ChangeNotifier {
  String title = "Tontine Page ";
  List<TontineModel> tontines = [];
  TontineModel? tontineById;

  Future<void> FetchAllTontines() async {
    List<TontineModel> list = await TontinesApi().getAllTontines();

    // ticketsList = list.map((ticket) => TicketModel.fromJson(ticket)).toList();

    tontines = list;
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
