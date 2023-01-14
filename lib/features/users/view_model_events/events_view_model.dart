import 'package:shared_preferences/shared_preferences.dart';
import '../evants_repositories/event_repository.dart';
import '../models_events/add_event_model.dart';
import '../models_events/event_model.dart';
import 'one_event_view_model.dart';

class UsersViewModel {
  String title = "User Page ";
  OneUserViewModel? eventModel;

  UsersRepository? eventsRepository;
  UsersViewModel({this.eventsRepository});

  Future<List<OneUserViewModel>> GetUserByCategorie(int id) async {
    List<UserModel> list = await eventsRepository!.getUserByCategorie(id);
    return list
        .map((listUser) => OneUserViewModel(eventModel: listUser))
        .toList();
  }

  Future<List<OneUserViewModel>> FetchAllUsers() async {
    List<UserModel> list = await eventsRepository!.getAllUsers();
    return list
        .map((listUser) => OneUserViewModel(eventModel: listUser))
        .toList();
  }

  Future<bool> UpdateUserByID(AddUserModel eventModel) async {
    var event = await eventsRepository!.updateUserByID(eventModel);
    return true;
  }

  Future<bool> AddUser(AddUserModel addUserModel) async {
    var event = await eventsRepository!.addUser(addUserModel);
    return true;
  }

  Future<bool> DeleteUserByID(int id) async {
    var eventModel = await eventsRepository!.deleteUserByID(id);
    return true;
  }

  Future<OneUserViewModel> GetUserByID(int? id) async {
    var eventModel = await eventsRepository!.getUserByID(id);
    return OneUserViewModel(eventModel: eventModel);
  }

  Future<OneUserViewModel> GetUserConnected() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString("userconnectedid");
    var useridint = int.parse(userid!);
    var eventModel = await eventsRepository!.getUserByID(useridint);
    return OneUserViewModel(eventModel: eventModel);
  }
  
}
