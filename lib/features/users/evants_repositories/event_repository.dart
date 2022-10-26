

import '../models_events/add_event_model.dart';
import '../models_events/event_model.dart';

abstract class UsersRepository {
  Future<List<UserModel>> getUserByCategorie(int id);
  Future<List<UserModel>> getAllUsers();
  Future<UserModel> getUserByID(int id);
  Future<AddUserModel> updateUserByID(AddUserModel eventModel);
  Future<bool> addUser(AddUserModel addUserModel);
  Future<bool> deleteUserByID(int id);
}
