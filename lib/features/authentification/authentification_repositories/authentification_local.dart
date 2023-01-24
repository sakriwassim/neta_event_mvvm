import 'package:neta_event_mvvm/features/authentification/models_authentification/token_model.dart';

import '../models_authentification/response_model.dart';
import 'authentification_repository.dart';

import 'package:http/http.dart' as http;

class EventsLocal extends AuthentificationRepository {
  @override
  Future<TokenModel> gettokenmodel() {
    throw UnimplementedError();
  }

  @override
  Future<RegisterResponseModel> register(
      int role_id, String nom_complet, String email, String password) {
    throw UnimplementedError();
  }
  
  @override
  Future<http.Response> login(String mail, String password) {
    throw UnimplementedError();
  }
}
