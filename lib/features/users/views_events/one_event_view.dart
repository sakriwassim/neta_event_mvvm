import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/users/views_events/update_event_view.dart';

import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/widgets/small_button_style.dart';
import '../evants_repositories/events_api.dart';
import '../models_events/event_model.dart';
import '../view_model_events/events_view_model.dart';
import '../view_model_events/one_event_view_model.dart';
import 'events_view.dart';

class OnUserView extends StatefulWidget {
  final int id;
  const OnUserView({super.key, required this.id});

  @override
  State<OnUserView> createState() => _OnUserViewState();
}

class _OnUserViewState extends State<OnUserView> {
  var data = UsersViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: AppBar(
            elevation: 0.0,
            shadowColor: Colors.white,
            title: const Text(
              "User details",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            flexibleSpace: const Center(
              child: Image(
                image: AssetImage('assets/130.png'),
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.transparent,
          )),
      body: Center(
        child: FutureBuilder<UserModel>(
          // future: data.GetUserByID(widget.id),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  // Image.asset("assets/130.png"),
                  Text(snapshot.data!.nomComplet!),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 50.0,
                          color: Color.fromARGB(255, 217, 15, 197),
                        ),
                        Text("${snapshot.data!.nomComplet} "),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.map,
                          size: 50.0,
                          color: Color.fromARGB(255, 217, 15, 197),
                        ),
                        Text("${snapshot.data!.adresse}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("participants actuels"),
                        Text("${snapshot.data!.nomComplet}"),
                      ],
                    ),
                  ),
                  const Text("Next Owner"),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                          'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateUserView(
                                          eventObj: snapshot.data!,
                                        )));
                          },
                          child: Button(
                            fontWeight: FontWeight.normal,
                            text: "MODIFIER",
                            fontSize: 20,
                            gradientbackground: gradientbackground,
                            height: heightbigbutton,
                            width: widthbigbutton,
                            textcolor: Colors.white,
                          )),
                      InkWell(
                          onTap: () async {
                            var delete =
                                await data.DeleteUserByID(snapshot.data!.id!);

                            if (delete == true) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GetAllUserView()));
                            }
                          },
                          child: Button(
                            fontWeight: FontWeight.normal,
                            text: "SUPPRIMER",
                            fontSize: 20,
                            gradientbackground: gradientbackground,
                            height: heightbigbutton,
                            width: widthbigbutton,
                            textcolor: Colors.white,
                          )),
                    ],
                  )
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
