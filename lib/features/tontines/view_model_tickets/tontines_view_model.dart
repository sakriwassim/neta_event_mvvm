
import '../models_tontines/tontine_model.dart';
import '../tontines_repositories/tontines_repository.dart';
import 'one_tontine_view_model.dart';

class TontinesViewModel {
  String title = "Tontine Page ";

  TontinesRepository? ticketsRepository;
  TontinesViewModel({this.ticketsRepository});

  Future<List<OneTontineViewModel>> FetchAllTontines() async {
    List<TontineModel> list = await ticketsRepository!.getAllTontines();
    return list
        .map((listTontine) => OneTontineViewModel(tontineModel: listTontine))
        .toList();
  }

  Future<OneTontineViewModel> GetTontineByID(int id) async {
    var ticketModel = await ticketsRepository!.getTontineByID(id);
    return OneTontineViewModel(tontineModel: ticketModel);
  }

  Future<bool> UpdateTontineByID(TontineModel addTontineModel) async {
    var ticket = await ticketsRepository!.updateTontineByID(addTontineModel);
    return true;
  }

  Future<bool> AddTontine(TontineModel addTontineModel) async {
    var event = await ticketsRepository!.addTontine(addTontineModel);
    return true;
  }

  Future<bool> DeleteTontineByID(int id) async {
    var ticketModel = await ticketsRepository!.deleteTontineByID(id);
    return true;
  }
}
