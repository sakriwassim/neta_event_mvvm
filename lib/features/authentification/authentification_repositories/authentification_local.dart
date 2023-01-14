import 'package:neta_event_mvvm/features/authentification/models_authentification/login_authentification_model.dart';
import 'package:neta_event_mvvm/features/authentification/models_authentification/token_model.dart';

import '../models_authentification/response_model.dart';
import 'authentification_repository.dart';

class EventsLocal extends AuthentificationRepository {
  @override
  Future<TokenModel> gettokenmodel() {
    throw UnimplementedError();
  }

  @override
  Future<LoginResponseModel> login(String mail, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<RegisterResponseModel> register(
      int role_id, String nom_complet, String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
