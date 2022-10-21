import 'package:flutter/material.dart';
import 'package:flutter_custom_tab_bar/models.dart';
import 'package:flutter_svg/svg.dart';
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

class _UserViewState extends State<UserView> with TickerProviderStateMixin {
  final formkey = GlobalKey<FormState>();
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;

  var data = UserViewModel(userRepository: UserApi());

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
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
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      child: ClipOval(
                          child: Image.asset("assets/profileimage.png")),
                    ),
                    Text(
                      "Sakri wassim",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  child: TabBar(
                    indicatorColor: Color.fromARGB(255, 214, 9, 204),
                    isScrollable: true,
                    controller: _tabController,
                    labelColor: Color.fromARGB(255, 214, 9, 204),
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "DONNEES"),
                      Tab(text: "PHOTO"),
                      Tab(text: "MOT DE PASSE"),
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 500,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFF2F2F2),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 255, 0, 208)),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                      width: 1,
                                    )),
                                labelText: 'Sakri wassim',
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 114, 59, 3), //<-- SEE HERE
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 255, 0, 208)),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                      width: 1,
                                    )),
                                labelText: 'Adresse e-mail',
                                prefixIcon: Icon(
                                  Icons.mail_outline_outlined,
                                  color: Colors.grey,
                                ),
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 114, 59, 3), //<-- SEE HERE
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 255, 0, 208)),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                      width: 1,
                                    )),
                                labelText: ' Mot de passe',

                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.grey,
                                ),
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 114, 59, 3), //<-- SEE HERE
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 255, 0, 208)),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                      width: 1,
                                    )),
                                labelText: ' Mot de passe',

                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.grey,
                                ),
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 114, 59, 3), //<-- SEE HERE
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

                                  UserModel userModel =
                                      UserModel.fromJson(event);

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
                      Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 20, right: 10, left: 10),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: SvgPicture.asset(
                                      "assets/icon_user/CameraButton.svg")),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 20, right: 10, left: 10),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: SvgPicture.asset(
                                      "assets/icon_user/GalleryButton.svg")),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFF2F2F2),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 255, 0, 208)),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                      width: 1,
                                    )),
                                labelText: 'Sakri wassim',
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 114, 59, 3), //<-- SEE HERE
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 255, 0, 208)),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                      width: 1,
                                    )),
                                labelText: 'Adresse e-mail',
                                prefixIcon: Icon(
                                  Icons.mail_outline_outlined,
                                  color: Colors.grey,
                                ),
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 114, 59, 3), //<-- SEE HERE
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 255, 0, 208)),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                      width: 1,
                                    )),
                                labelText: ' Mot de passe',

                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.grey,
                                ),
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 114, 59, 3), //<-- SEE HERE
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 255, 0, 208)),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                      width: 1,
                                    )),
                                labelText: ' Mot de passe',

                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.grey,
                                ),
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 114, 59, 3), //<-- SEE HERE
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

                                  UserModel userModel =
                                      UserModel.fromJson(event);

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
