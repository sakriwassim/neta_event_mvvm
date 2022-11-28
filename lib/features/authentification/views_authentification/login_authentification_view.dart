import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/register_authentification_view.dart';

import '../../../core/signein/card_google_widget.dart';
import '../../../core/widgets/signein_signeup_button_style.dart';
import '../../home/bottom_navigation_bar.dart';
import '../authentification_repositories/authentification_api.dart';
import '../models_authentification/login_authentification_model.dart';
import '../view_model_authentification/authentification_view_model.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formkey = GlobalKey<FormState>();
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;
  bool _isObscure = true;

  var data = AuthentificationViewModel(
      authentificationRepository: AuthentificationApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
           // autovalidateMode: AutovalidateMode.always,
            key: formkey,
            child: Column(
              children: [
                Image.asset(
                  'assets/SlashScreen/netaLogo.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 25.0,
                        right: 5.0,
                        top: 10,
                        bottom: 16,
                      ),
                      child: const Text(
                        "Se connecter",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: textFieldDecorationWithicon(
                      "entre le email",
                      "Adresse e-mail",
                      Icons.mail,
                      Colors.grey,
                    ),
                    validator: (value) {
                      String pattern =
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                      RegExp regex = RegExp(pattern);

                      if (value == null ||
                          value.isEmpty ||
                          !regex.hasMatch(value)) {
                        return "Enter a valid email address";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (text) {
                      emailfield = text;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: textFieldDecorationWithicon(
                      "Mot de passe",
                      "entre le password",
                      Icons.lock_outline,
                      Colors.grey,
                    ),
                    validator: (value) {
                      String pattern =
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                      RegExp regex = RegExp(pattern);

                      if (value == null ||
                          value.isEmpty ||
                          !regex.hasMatch(value)) {
                        return "Enter a valid mot de pass";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (text) {
                      passwordfield = text;
                    },
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      children: [
                        const Text(
                          " Se rappeler",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "mot de passe oublié?",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        var event = {
                          "role_id": 1,
                          "packs_id": 1,
                          "nom_complet": "Mousa Keita",
                          "email": emailfield.toString(),
                          "telephone": 70213645,
                          "adresse": "Faladiè",
                          "image": "https://cheminverslimage",
                          "password": passwordfield.toString()
                        };

                        AuthentificationModel authentificationModel =
                            AuthentificationModel.fromJson(event);

                        bool verif = await data.Login(authentificationModel);
                        if (verif == true) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ));
                        }
                      }
                    },
                    child: SigneInUpButton(
                      text: "SE CONNECTER",
                    )),
                Center(
                  child: SizedBox(
                    height: 80,
                    width: 300,
                    child: InkWell(
                      onTap: () {},
                      child: CardGoogle(
                        image: 'assets/SlashScreen/google.png',
                        title: 'Se conncter avec Google',
                      ),
                    ),
                  ),
                ),
                CardGoogle(
                  image: 'assets/SlashScreen/Facebook.png',
                  title: 'Se conncter avec Facebook',
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Row contents vertically,
                    children: [
                      const Text(
                        " Vous n'avez pas un compte",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterView(),
                              ));
                        },
                        child: const Text(
                          " S'inscrire",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
