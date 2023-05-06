import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../authentification/models_authentification/token_model.dart';
import '../models_users/event_by_id_model.dart';
import '../users_repositories/users_api.dart';
import '../models_users/add_event_model.dart';
import '../models_users/event_model.dart';

class UsersViewModel extends ChangeNotifier {
  String title = "User Page ";
  UserModel? eventModel;
  List<UserModel> usersByCategorie = [];
  List<UserModel> users = [];
  UserModelById? userById;
  UserModelById? userConnected;
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

  Future<void> UpdateUserByID(
      AddUserModel eventModel, String userconnectedId) async {
    loading = true;
    var response = await UsersApi().updateUserByID(eventModel, userconnectedId);
    print(response?.body);
    if (response?.statusCode == 200) {
      isBack = true;
    }
    loading = false;
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
    userConnected = await UsersApi().getUserByID(tokenModel?.userId);
    notifyListeners();
  }
}
