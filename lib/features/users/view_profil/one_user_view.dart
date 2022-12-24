import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:neta_event_mvvm/features/users/view_profil/user_view.dart';

import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/string.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text2.dart';
import '../evants_repositories/events_api.dart';
import '../view_model_events/events_view_model.dart';
import '../view_model_events/one_event_view_model.dart';

class OneUserView extends StatefulWidget {
  const OneUserView({super.key});

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
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          shadowColor: Colors.white,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
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
                  SizedBox(
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AdvancedNetworkImage(
                              snapshot.data!.image,
                              fallbackAssetImage: defaultImage),

                          //   backgroundImage: NetworkImage(snapshot.data!.image),
                          backgroundColor: Colors.transparent,
                        ),
                        Text(
                          snapshot.data!.nom_complet,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: Column(
                                children: [
                                  TextWidget(
                                    title: "420",
                                    fontSize: 18.00,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  const Text(
                                    "ticket",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: Column(
                                children: [
                                  TextWidget(
                                    title: "1800\$",
                                    fontSize: 18.00,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  const Text(
                                    "spent",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
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
                            child: Button(
                                  fontWeight: FontWeight.normal,
                              text: "Edit Profile",  fontSize: fontSizemediumbutton,
                  gradientbackground: gradientbackground,
                  height: heightmediumbutton,
                  width: widthmediumbutton, textcolor:  Colors.white,
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
                                const Icon(
                                  Icons.person_outline_sharp,
                                  color: Colors.grey,
                                  size: 40.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10),
                                  child: Text(
                                    snapshot.data!.nom_complet,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.mail,
                                  color: Colors.grey,
                                  size: 40.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10),
                                  child: Text(
                                    snapshot.data!.email,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.map,
                                  color: Colors.grey,
                                  size: 40.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10),
                                  child: Text(
                                    snapshot.data!.adresse,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                  size: 40.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10),
                                  child: Text(
                                    snapshot.data!.telephone,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                )
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
