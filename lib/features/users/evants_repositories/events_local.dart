
import 'package:neta_event_mvvm/features/events/models_events/add_event_model.dart';
import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/event_repository.dart';

import '../models_events/add_event_model.dart';
import '../models_events/event_model.dart';
import 'event_repository.dart';

class UsersLocal extends UsersRepository {
  @override
  Future<List<UserModel>> getAllUsers() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUserByID(int id) {
    throw UnimplementedError();
  }

  @override
  Future<AddUserModel> updateUserByID(AddUserModel eventModel) {
    throw UnimplementedError();
  }

  @override
  Future<bool> addUser(AddUserModel addUserModel) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteUserByID(int id) {
    throw UnimplementedError();
  }
  
  @override
  Future<UserModel> getUserByUsersByCategorie(int id) {
    throw UnimplementedError();
  }
  
  @override
  Future<List<UserModel>> getUserByCategorie(int id) {
    throw UnimplementedError();
  }
}
