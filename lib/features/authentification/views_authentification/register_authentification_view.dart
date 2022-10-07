import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/login_authentification_view.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/one_event_view_model.dart';

import '../../events/evants_repositories/events_api.dart';
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

  var data = AuthentificationViewModel(
      authentificationRepository: AuthentificationApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          shadowColor: Colors.white,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
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
                    // controller: TextEditingController(
                    //   text: widget.eventObj.libelle,
                    //  ),
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
                      hintText: 'entre le email',
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
                      if (value!.isEmpty) {
                        return "entre le email";
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
                    //    controller:
                    //      TextEditingController(text: widget.eventObj.description),
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
                      if (value!.isEmpty) {
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
                    //    controller:
                    //      TextEditingController(text: widget.eventObj.description),
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
                      if (value!.isEmpty) {
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
                  child: Container(
                    height: 60,
                    padding: EdgeInsets.only(
                      left: 70.0,
                      right: 70.0,
                      top: 16,
                      bottom: 5,
                    ),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(13.0),
                      gradient: new LinearGradient(
                        colors: [Colors.purple, Colors.pink],
                        begin: FractionalOffset.centerLeft,
                        end: FractionalOffset.centerRight,
                      ),
                    ),
                    child: Text(
                      "SE CONNECTER",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          height: 60,
                          padding: EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            top: 10,
                            bottom: 5,
                          ),
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/SlashScreen/google.png',
                                width: MediaQuery.of(context).size.width * 0.1,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                //scale: 0.1,
                              ),
                              Expanded(
                                child: Text(
                                  "Se conncter avec Google",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.72,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          height: 60,
                          padding: EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            top: 10,
                            bottom: 5,
                          ),
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/SlashScreen/Facebook.png',
                                width: MediaQuery.of(context).size.width * 0.1,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                //scale: 0.1,
                              ),
                              Expanded(
                                child: Text(
                                  " Se conncter avec Facebook",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Row contents vertically,
                    children: [
                      Text(
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
                        child: Text(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
