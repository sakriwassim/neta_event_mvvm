import 'package:neta_event_mvvm/features/authentification/models_authentification/token_model.dart';

import 'package:http/http.dart' as http;

abstract class AuthentificationRepository {
  Future<dynamic> register(
      int role_id, String nom_complet, String email, String password);
  Future<http.Response> login(String mail, String password);
  Future<TokenModel> gettokenmodel();
}
