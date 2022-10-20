import '../models_user/user_model.dart';
import '../user_repositories/user_repository.dart';

class UserViewModel {
  String title = "Event Page ";

  UserRepository? userRepository;
  UserViewModel({this.userRepository});

  Future<bool> Login(UserModel authentificationModel) async {
    var authentification = await userRepository!.login(authentificationModel);

    print("authentificationviewmodel");
    print(authentification);

    return authentification;
  }

  Future<bool> Register(UserModel userModel) async {
    var authentification = await userRepository!.register(userModel);
    return authentification;
  }

  Future<bool> Cleanpref() async {
    try {
      var token = await userRepository!.cleanpref();
      return true;
    } catch (e) {
      return false;
    }
  }
}
