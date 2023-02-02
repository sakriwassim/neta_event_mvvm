import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../authentification/models_authentification/token_model.dart';
import '../evants_repositories/events_api.dart';
import '../models_events/add_event_model.dart';
import '../models_events/event_model.dart';
import 'one_event_view_model.dart';

class UsersViewModel extends ChangeNotifier {
  String title = "User Page ";
  UserModel? eventModel;
  List<UserModel> usersByCategorie = [];
  List<UserModel> users = [];
  UserModel? userById;
  UserModel? userConnected;
  TokenModel? tokenModel;
  bool loading = false;
  bool isBack = false;

  Future<void> GetUserByCategorie(int id) async {
    List<UserModel> list = await UsersApi().getUserByCategorie(id);
    usersByCategorie = list;
    notifyListeners();
  }

  Future<void> FetchAllUsers() async {
    List<UserModel> list = await UsersApi().getAllUsers();
    users = list;
    notifyListeners();
  }

  Future<bool> UpdateUserByID(
      AddUserModel eventModel, String userconnectedId) async {
    var event = await UsersApi().updateUserByID(eventModel, userconnectedId);
    return true;
  }

  Future<bool> AddUser(AddUserModel addUserModel) async {
    var event = await UsersApi().addUser(addUserModel);
    return true;
  }

  Future<bool> DeleteUserByID(int id) async {
    var eventModel = await UsersApi().deleteUserByID(id);
    return true;
  }

  Future<void> GetUserByID(int? id) async {
    var eventModel = await UsersApi().getUserByID(id);
    userById = eventModel;
  }

  Future<void> GetUserConnected() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    Map<String, dynamic> payload = Jwt.parseJwt(token.toString());
    tokenModel = TokenModel.fromJson(payload);
    var eventModel = await UsersApi().getUserByID(tokenModel!.userId);
    userConnected = eventModel;
    notifyListeners();
  }
}
