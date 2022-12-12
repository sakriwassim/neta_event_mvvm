import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/login_authentification_view.dart';

import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/widgets/card_google_widget.dart';
import '../../../core/widgets/small_button_style.dart';
import '../authentification_repositories/authentification_api.dart';
import '../models_authentification/login_authentification_model.dart';
import '../view_model_authentification/authentification_view_model.dart';

class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formkey = GlobalKey<FormState>();
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;
  late String passwordfield2;

  var data = AuthentificationViewModel(
      authentificationRepository: AuthentificationApi());

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
            "S'inscrire",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF2F2F2),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 255, 0, 208)),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      labelText: 'Sakri wassim',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
                      ),
                      hintText: 'entre le nom de user',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "entre le nom_complet";
                      } else {
                        // libellefield = widget.eventObj.libelle;
                        return null;
                      }
                    },
                    onChanged: (text) {
                      nomcompletfield = text;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    //controller: TextEditingController(text: widget.eventObj.prix),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF2F2F2),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 255, 0, 208)),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      labelText: 'Adresse e-mail',
                      prefixIcon: Icon(
                        Icons.mail_outline_outlined,
                        color: Colors.grey,
                      ),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
                      ),
                      hintText: 'entre le email',
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
                        // prixfield = widget.eventObj.prix;
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
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF2F2F2),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 255, 0, 208)),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      labelText: ' Mot de passe',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      ),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
                      ),
                      hintText: 'entre le password',
                    ),
                    validator: (value) {
                      String pattern =
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                      RegExp regex = RegExp(pattern);
                      if (value == null ||
                          value.isEmpty ||
                          !regex.hasMatch(value)) {
                        return "entre le password";
                      } else {
                        //dateMesurefield = datenow.toString();
                        //descriptionfield = widget.eventObj.description.toString();
                        return null;
                      }
                    },
                    onChanged: (text) {
                      passwordfield = text;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF2F2F2),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 255, 0, 208)),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      labelText: ' Mot de passe',

                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      ),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
                      ),
                      hintText: 'entre le password',

                      //  suffixIcon: IconButton(
                      //           icon: Icon(_isObscure
                      //               ? Icons.visibility
                      //               : Icons.visibility_off),
                      //           onPressed: () {
                      //             setState(() {
                      //               _isObscure = !_isObscure;
                      //             });
                      //           })
                    ),
                    validator: (value) {
                      var result = passwordfield2.compareTo(passwordfield);

                      if (
                          //passwordfield2 == passwordfield
                          value!.isEmpty) {
                        return "entre le password";
                      } else if (result < 0) {
                        return "entre le password";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (text) {
                      passwordfield2 = text;
                    },
                  ),
                ),
                InkWell(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        var event = {
                          "role_id": 1,
                          "packs_id": 1,
                          "nom_complet": nomcompletfield.toString(),
                          "email": emailfield.toString(),
                          "telephone": 70213645,
                          "adresse": "Faladiè",
                          "image": "https://cheminverslimage",
                          "password": passwordfield.toString()
                        };

                        AuthentificationModel authentificationModel =
                            AuthentificationModel.fromJson(event);

                        bool verif = await data.Register(authentificationModel);
                        if (verif == true) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginView(),
                              ));
                        }
                      }
                    },
                    child: Button(
                      text: "S'INSCRIRE",
                      fontSize: fontSizebigbutton,
                      height: heightbigbutton,
                      width: widthbigbutton,
                      gradientbackground: gradientbackground,
                    )),
                InkWell(
                  onTap: () {},
                  child: CardGoogle(
                    image: 'assets/SlashScreen/google.png',
                    title: 'Se conncter avec Google',
                    height: heightgoogle,
                    width: widthgoogle,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: CardGoogle(
                    image: 'assets/SlashScreen/Facebook.png',
                    title: 'Se connecter avec Facebook',
                    height: heightgoogle,
                    width: widthgoogle,
                  ),
                ),
                Row(
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ));
                      },
                      child: const Text(
                        " Signin",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
