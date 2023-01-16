import 'dart:convert';

import 'package:neta_event_mvvm/features/authentification/models_authentification/token_model.dart';

import '../models_authentification/response_model.dart';

abstract class AuthentificationRepository {
  Future<dynamic> register(
      int role_id, String nom_complet, String email, String password);
  Future<dynamic> login(String mail, String password);
  Future<TokenModel> gettokenmodel();
}
