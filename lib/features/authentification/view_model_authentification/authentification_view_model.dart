import '../authentification_repositories/authentification_repository.dart';
import '../models_authentification/login_authentification_model.dart';

class AuthentificationViewModel {
  String title = "Event Page ";
  bool? authentification;
  AuthentificationRepository? authentificationRepository;
  AuthentificationViewModel({this.authentificationRepository});

  Future<bool> Login(AuthentificationModel authentificationModel) async {
    authentification =
        await authentificationRepository!.login(authentificationModel);

    print("authentificationviewmodel");
    print(authentification);

    return true;
  }

  Future<bool> Register(AuthentificationModel authentificationModel) async {
    var authentification =
        await authentificationRepository!.register(authentificationModel);
    if (authentification == true) {
      return true;
    } else {
      return false;
    }
  }
}
