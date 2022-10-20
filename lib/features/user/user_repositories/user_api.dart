import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models_user/response_model.dart';
import '../models_user/user_model.dart';
import 'user_repository.dart';

class UserApi extends UserRepository {
  //List tonken = [];
  String? verif;
  String? authentificationtoken;
  int? code;
  String? token;
  // @override
  // Future<bool> login(UserModel userModel) async {
  //   try {
  //     // final eventId = eventModel.id;
  //     final eventModelJson = userModel.toJSON();

  //     Map<String, String> headers = {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     };

  //     final body = jsonEncode(eventModelJson);

  //     String link = 'https://frozen-refuge-80965.herokuapp.com/api/v1/Login';

  //     var url = Uri.parse(link);

  //     http.Response response =
  //         await http.post(url, headers: headers, body: body);
  //     var responsebody = jsonEncode(response.body);
  //     var responsebodydecode = jsonDecode(response.body);

  //     UserResponseModel authentificationResponseModel =
  //         UserResponseModel.fromJson(responsebodydecode);

  //     var token = authentificationResponseModel.data.token;
  //     var code = authentificationResponseModel.code;

  //     print(token);
  //     print(code);

  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.clear();
  //     prefs.setString("token", authentificationtoken.toString());
  //     print("Seccess");

  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  @override
  Future<UserModel> updateCategorieByID(UserModel userModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final eventId = userModel.role_id;
      final eventModelJson = userModel.toJSON();

      var headers = {
        'Content-type': 'application/json',
        "Accept": "application/json",
        'authorization': 'Bearer $token',
      };

      final body = eventModelJson;

      String link = 'https://frozen-refuge-80965.herokuapp.com/api/v1/User/1';

      var url = Uri.parse(link);

      http.Response response = await http.put(url,
          headers: headers, body: json.encode(eventModelJson));
      var responsebody = jsonDecode(response.body);
      // print(eventModelJson);
      print(responsebody);
    } catch (e) {
      print(e);
    }

    return userModel;
  }

  @override
  Future<bool> register(UserModel userModel) async {
    try {
      final eventModelJson = userModel.toJSON();
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final body = jsonEncode(eventModelJson);

      String link = 'https://frozen-refuge-80965.herokuapp.com/api/v1/Register';

      var url = Uri.parse(link);

      http.Response response =
          await http.post(url, headers: headers, body: body);
      var responsebody = jsonEncode(response.body);

      print(responsebody);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> cleanpref() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> login(UserModel userModel) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
