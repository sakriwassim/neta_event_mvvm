import '../models_packs/pack_model.dart';
import '../packs_repositories/pack_repository.dart';
import 'one_pack_view_model.dart';

class PacksViewModel {
  //PackModel
  String title = "Pack Page ";

  PacksRepository? packsRepository;
  PacksViewModel({this.packsRepository});

  Future<List<OnePackViewModel>> FetchAllPacks() async {
    List<PackModel> list = await packsRepository!.getAllPacks();
    return list
        .map((listPack) => OnePackViewModel(packModel: listPack))
        .toList();
  }

  Future<OnePackViewModel> GetPackByID(int id) async {
    var eventModel = await packsRepository!.getPackByID(id);
    return OnePackViewModel(packModel: eventModel);
  }

  Future<bool> UpdatePackByID(PackModel eventModel) async {
    var event = await packsRepository!.updatePackByID(eventModel);
    return true;
  }

  Future<bool> AddPack(PackModel packModel) async {
    var event = await packsRepository!.addPack(packModel);
    return true;
  }

  Future<bool> DeletePackByID(int id) async {
    var eventModel = await packsRepository!.deletePackByID(id);
    return true;
  }
}
