import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/widgets/medium_button.dart';

import '../../../core/widget/text_widget.dart';
import '../evants_repositories/events_api.dart';
import '../models_events/add_event_model.dart';
import '../view_model_events/events_view_model.dart';
import '../view_model_events/one_event_view_model.dart';

class UserView extends StatefulWidget {
  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> with TickerProviderStateMixin {
  final formkey = GlobalKey<FormState>();
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;
  late String phonefield;
  late String adressefield;
  late String ancienpasswordfield;
  late String nouveaupasswordfield;
  late String confirmerpasswordfield;

  var data = UsersViewModel(eventsRepository: UsersApi());

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
        child: FutureBuilder<OneUserViewModel>(
          future: data.GetUserByID(1),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
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
                            snapshot.data!.nom_complet,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                      TabBar(
                        indicatorColor: Color.fromARGB(255, 214, 9, 204),
                        isScrollable: true,
                        controller: _tabController,
                        labelColor: Color.fromARGB(255, 214, 9, 204),
                        unselectedLabelColor: Colors.grey,
                        tabs: const [
                          Tab(text: "DONNEES"),
                          Tab(text: "PHOTO"),
                          Tab(text: "MOT DE PASSE"),
                        ],
                      ),
                      SizedBox(
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 255, 0, 208)),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                            width: 1,
                                          )),
                                      labelText: 'Sakri wassim',
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                      ),
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 114, 59, 3),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 255, 0, 208)),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 255, 0, 208)),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                            width: 1,
                                          )),
                                      labelText: 'Address',

                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: Colors.grey,
                                      ),
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 114, 59, 3), //<-- SEE HERE
                                      ),
                                      hintText: 'entre le Address',

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
                                        return "entre le Address";
                                      } else {
                                        //dateMesurefield = datenow.toString();
                                        //descriptionfield = widget.eventObj.description.toString();
                                        return null;
                                      }
                                    },
                                    onChanged: (text) {
                                      adressefield = text;
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 255, 0, 208)),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                            width: 1,
                                          )),
                                      labelText: ' phone nbr',
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: Colors.grey,
                                      ),
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 114, 59, 3), //<-- SEE HERE
                                      ),
                                      hintText: 'entre le phone nbr',
                                    ),

                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "entre le phone nbr";
                                      } else {
                                        //dateMesurefield = datenow.toString();
                                        //descriptionfield = widget.eventObj.description.toString();
                                        return null;
                                      }
                                    },
                                    onChanged: (text) {
                                      phonefield = text;
                                    },
                                  ),
                                ),
                                InkWell(
                                    onTap: () async {
                                      if (formkey.currentState!.validate()) {
                                        var event = {
                                          "role_id": int.parse(
                                              '${snapshot.data!.role_id}'), //1,
                                          "packs_id": int.parse(
                                              '${snapshot.data!.packs_id}'),
                                          "nom_complet": nomcompletfield,
                                          "email": emailfield,
                                          "telephone": int.parse('$phonefield'),
                                          "adresse": adressefield,
                                          "image":
                                              snapshot.data!.image.toString(),
                                          "password":
                                              snapshot.data!.password.toString()
                                        };

                                        AddUserModel eventformJson =
                                            AddUserModel.fromJson(event);

                                        setState(() {
                                          data.UpdateUserByID(eventformJson);
                                        });
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
                                        top: 20,
                                        bottom: 20,
                                        right: 10,
                                        left: 10),
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: SvgPicture.asset(
                                            "assets/icon_user/CameraButton.svg")),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                        right: 10,
                                        left: 10),
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: SvgPicture.asset(
                                            "assets/icon_user/GalleryButton.svg")),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      title: 'Les étapes à suivre:',
                                    ),
                                    TextWidget(
                                      title: "1- Inserer l'ancien mot de passe",
                                    ),
                                    TextWidget(
                                      title:
                                          "2- Inserer le nouveau mot de passe",
                                    ),
                                    TextWidget(
                                      title:
                                          "3- Reinserer le nouveau mot de passe",
                                    ),
                                  ],
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 255, 0, 208)),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                            width: 1,
                                          )),
                                      labelText: ' Ancien mot de passe',

                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: Colors.grey,
                                      ),
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 114, 59, 3), //<-- SEE HERE
                                      ),
                                      hintText: 'entre le ancien password',

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
                                        return "entre le ancien password";
                                      } else {
                                        //dateMesurefield = datenow.toString();
                                        //descriptionfield = widget.eventObj.description.toString();
                                        return null;
                                      }
                                    },
                                    onChanged: (text) {
                                      ancienpasswordfield = text;
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 255, 0, 208)),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                            width: 1,
                                          )),
                                      labelText: ' Nouveau mot de passe',

                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: Colors.grey,
                                      ),
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 114, 59, 3), //<-- SEE HERE
                                      ),
                                      hintText: 'entre le nouveau password',

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
                                        return "entre le nouveau password";
                                      } else {
                                        //dateMesurefield = datenow.toString();
                                        //descriptionfield = widget.eventObj.description.toString();
                                        return null;
                                      }
                                    },
                                    onChanged: (text) {
                                      nouveaupasswordfield = text;
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 255, 0, 208)),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                            width: 1,
                                          )),
                                      labelText: '  Confirmer mot de passe',

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
                                      confirmerpasswordfield = text;
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                      onTap: () async {
                                        if (formkey.currentState!.validate()) {
                                          // if (confirmerpasswordfield ==
                                          //         nouveaupasswordfield &&
                                          //    ancienpasswordfield ==
                                          //        snapshot.data!.password) {
                                          var event = {
                                            "role_id": int.parse(
                                                '${snapshot.data!.role_id}'), //1,
                                            "packs_id": int.parse(
                                                '${snapshot.data!.packs_id}'),
                                            "nom_complet": snapshot
                                                .data!.nom_complet
                                                .toString(),
                                            "email":
                                                snapshot.data!.email.toString(),
                                            "telephone": int.parse(
                                                '${snapshot.data!.telephone}'),
                                            "adresse": snapshot.data!.adresse
                                                .toString(),
                                            "image":
                                                snapshot.data!.image.toString(),
                                            "password": confirmerpasswordfield
                                                .toString()
                                          };

                                          AddUserModel eventformJson =
                                              AddUserModel.fromJson(event);

                                          setState(() {
                                            data.UpdateUserByID(eventformJson);
                                          });
                                          // } else {
                                          //   print(
                                          //       "confirm or ancien password is  false ");
                                          // }
                                        }
                                      },
                                      child: MediumButton(
                                        text: "APPLIQUER",
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          }),
        ),
      ),
    );
  }
}
