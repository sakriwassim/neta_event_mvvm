import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/failure.dart';
import '../models_tontines/add_tontine_model.dart';
import '../models_tontines/tontine_model.dart';
import '../tontines_repositories/tontines_api.dart';

class TontinesViewModel extends ChangeNotifier {
  String title = "Tontine Page ";
  List<TontineModel> tontines = [];
  TontineModel? tontineById;
  bool? loading = false;
  bool isBack = false;
  String? messege;
  String? statusCode;

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

  Future<void> AddTontine(AddTontineModel? addTontineModel) async {
    loading = true;
    var response = await TontinesApi().addTontine(addTontineModel);

    if (response.isRight()) {
      messege = "tontines added";
      notifyListeners();
      isBack = true;
      notifyListeners();
    }

    if (response.isLeft()) {
      print(response.fold((l) => messege = l, (r) => null));
      // response.fold((l) => messege = l, (r) => null);
      notifyListeners();
      loading = false;
      notifyListeners();
    }
  }
}

Future<bool> DeleteTontineByID(int id) async {
  var ticketModel = await TontinesApi().deleteTontineByID(id);
  return true;
}
