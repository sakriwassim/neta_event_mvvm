import 'authentification_repository.dart';

class EventsLocal extends AuthentificationRepository {
  @override
  Future<bool> login(loginModel) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<bool> register(registerModel) {
    throw UnimplementedError();
  }

  @override
  Future<bool> cleanpref() {
    throw UnimplementedError();
  }
}
