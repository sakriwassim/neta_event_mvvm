import '../models_user/user_model.dart';

abstract class UserRepository {
  Future<bool> register(UserModel userModel);
  Future<bool> login(UserModel userModel);
  Future<bool> cleanpref();
}
