import '../models_authentification/login_authentification_model.dart';

abstract class AuthentificationRepository {
  Future<bool> register(AuthentificationModel authentificationModel);
  Future<bool> login(AuthentificationModel authentificationModel);
  Future<bool> cleanpref();
}
