import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/features/users/view_profil/widget/card_widget_edit_profile.dart';
import '../models_users/event_by_id_model.dart';
import '../models_users/event_model.dart';
import 'editprofilcompte_view.dart';
import 'editpwd_view.dart';

class UserView extends StatelessWidget {
  UserModelById? userModel;
  UserView({required this.userModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          shadowColor: Colors.white,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            "Paramètres généraux du profil",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditCompte(
                          userModel: userModel,
                        ),
                      ));
                },
                child: CardWidgetEditprofile(
                  icon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 175, 76, 150),
                    size: 30.0,
                  ),
                  text: 'Paramètres du compte',
                  height: heightbigbutton,
                  width: widthbigbutton,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPwd(
                          userModel: userModel,
                        ),
                      ));
                },
                child: CardWidgetEditprofile(
                  icon: Icon(
                    Icons.security,
                    color: Color.fromARGB(255, 175, 76, 150),
                    size: 30.0,
                  ),
                  text: 'Sécurité et connexion',
                  height: heightbigbutton,
                  width: widthbigbutton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
