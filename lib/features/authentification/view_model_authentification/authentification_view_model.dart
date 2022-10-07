import '../authentification_repositories/authentification_repository.dart';
import '../models_authentification/login_authentification_model.dart';

class AuthentificationViewModel {
  String title = "Event Page ";

  AuthentificationRepository? authentificationRepository;
  AuthentificationViewModel({this.authentificationRepository});

  Future<bool> Login(AuthentificationModel authentificationModel) async {
    var authentification =
        await authentificationRepository!.login(authentificationModel);

    print("authentificationviewmodel");
    print(authentification);

    return authentification;
  }

  Future<bool> Register(AuthentificationModel authentificationModel) async {
    var authentification =
        await authentificationRepository!.register(authentificationModel);
    return authentification;
  }
}
