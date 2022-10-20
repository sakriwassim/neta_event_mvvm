import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/widgets/medium_button.dart';
import 'package:neta_event_mvvm/core/widgets/small_button_style.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/login_authentification_view.dart';

import '../../../bottom_navigation_bar.dart';
import '../../../core/widgets/signein_signeup_button_style.dart';
import '../models_user/user_model.dart';
import '../user_repositories/user_api.dart';
import '../view_model_user/user_view_model.dart';

class UserView extends StatefulWidget {
  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final formkey = GlobalKey<FormState>();
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;

  var data = UserViewModel(userRepository: UserApi());

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
            "Profile",
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
                // Container(
                //   child: TabBar(
                //     tabs: [
                //       Tab(icon: Icon(Icons.directions_car)),
                //       Tab(icon: Icon(Icons.directions_transit)),
                //       Tab(icon: Icon(Icons.directions_bike)),
                //     ],
                //   ),
                // ),

                // TabBarView(
                //   children: [
                //     Icon(Icons.directions_car),
                //     Icon(Icons.directions_transit),
                //     Icon(Icons.directions_bike),
                //   ],
                // ),
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
                          "id": 1,
                          "role_id": 1,
                          "packs_id": 1,
                          "nom_complet": nomcompletfield.toString(),
                          "email": emailfield.toString(),
                          "telephone": 70213645,
                          "adresse": "Faladiè",
                          "image": "https://cheminverslimage",
                          "password": passwordfield.toString(),
                          "remember_token": null,
                          "created_at": "2022-10-11T12:22:04.000000Z",
                          "updated_at": "2022-10-11T12:22:04.000000Z"
                        };

                        UserModel userModel = UserModel.fromJson(event);

                        bool verif = await data.Register(userModel);
                        if (verif == true) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ));
                        }
                      }
                    },
                    child: MediumButton(
                      text: "APPLIQUER",
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
