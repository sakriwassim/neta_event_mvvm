import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/packs/packs_repositories/packs_api.dart';

import '../models_packs/pack_model.dart';

import 'one_pack_view_model.dart';

class PacksViewModel extends ChangeNotifier {
  //PackModel
  String title = "Pack Page ";
  List<OnePackViewModel> packs = [];


  Future<void> FetchAllPacks() async {
    List<PackModel> list = await PacksApi().getAllPacks();
    packs = list
        .map((listPack) => OnePackViewModel(packModel: listPack))
        .toList();
  }

  Future<OnePackViewModel> GetPackByID(int id) async {
    var eventModel = await PacksApi().getPackByID(id);
    return OnePackViewModel(packModel: eventModel);
  }

  Future<bool> UpdatePackByID(PackModel eventModel) async {
    var event = await PacksApi().updatePackByID(eventModel);
    return true;
  }

  Future<bool> AddPack(PackModel packModel) async {
    var event = await PacksApi().addPack(packModel);
    return true;
  }

  Future<bool> DeletePackByID(int id) async {
    var eventModel = await PacksApi().deletePackByID(id);
    return true;
  }
}
