import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/users/view_profil/user_view.dart';

import '../../../core/widgets/medium_button.dart';
import '../evants_repositories/events_api.dart';
import '../view_model_events/events_view_model.dart';
import '../view_model_events/one_event_view_model.dart';

class OneUserView extends StatefulWidget {
  @override
  State<OneUserView> createState() => _OneUserViewState();
}

class _OneUserViewState extends State<OneUserView> {
  final formkey = GlobalKey<FormState>();
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;

  var data = UsersViewModel(eventsRepository: UsersApi());

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
        child: FutureBuilder<OneUserViewModel>(
          future: data.GetUserByID(1),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Container(
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text("420"),
                                Text("ticket"),
                              ],
                            ),
                            Column(
                              children: [
                                Text("1800\$"),
                                Text("spent"),
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserView(),
                                  ));
                            },
                            child: MediumButton(
                              text: "Edit",
                            )),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(20),
                  //   child: Text(" fdsjfhdkjf ds fsjd khsf  hfkj dkjs"),
                  // ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      // padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_outline_sharp,
                                  color: Colors.grey,
                                  size: 40.0,
                                ),
                                Text(
                                  snapshot.data!.nom_complet,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: Colors.grey,
                                  size: 40.0,
                                ),
                                Text(
                                  snapshot.data!.email,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.map,
                                  color: Colors.grey,
                                  size: 40.0,
                                ),
                                Text(snapshot.data!.adresse)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                  size: 40.0,
                                ),
                                Text(snapshot.data!.telephone)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
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
