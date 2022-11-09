import 'package:flutter/material.dart';

import '../features/authentification/authentification_repositories/authentification_api.dart';
import '../features/authentification/view_model_authentification/authentification_view_model.dart';
import '../features/authentification/views_authentification/login_authentification_view.dart';
import '../features/users/evants_repositories/events_api.dart';
import '../features/users/view_model_events/events_view_model.dart';
import '../features/users/view_model_events/one_event_view_model.dart';
import '../features/users/view_profil/one_user_view.dart';
import '../features/users/views_events/events_view.dart';

class SideBarMenu extends StatelessWidget {
  Function? callbackFunctionlogout;
  String? imagepath;

  SideBarMenu({
    Key? key,
    required this.callbackFunctionlogout,
  }) : super(key: key);

  var data = UsersViewModel(eventsRepository: UsersApi());

  var data2 = AuthentificationViewModel(
      authentificationRepository: AuthentificationApi());

  // logout() {
  //   setState(() {
  //     data2.Cleanpref();
  //   });
  // }
  getimge() async {
    OneUserViewModel modeluser = await data.GetUserByID(1);
    var imagepath = modeluser.image;
    return imagepath;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FutureBuilder<OneUserViewModel>(
                    future: data.GetUserByID(1),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data!.image),
                          backgroundColor: Colors.transparent,
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const CircularProgressIndicator();
                    }),
                  ),

                  // CircleAvatar(
                  //   child:
                  //       ClipOval(child: Image.asset("assets/profileimage.png")),
                  // ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Positioned(
                        // bottom: 8.0,
                        // left: 4.0,
                        child: Text(
                          "Sakri wassim",
                          style: TextStyle(
                              color: Color.fromARGB(255, 183, 27, 27),
                              fontSize: 20),
                        ),
                      ),
                      Positioned(
                        // bottom: 8.0,
                        // left: 4.0,
                        child: Text(
                          "sakriwassim@gmail.com",
                          style: TextStyle(
                              color: Color.fromARGB(255, 183, 27, 27),
                              fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OneUserView()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('Evenements'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GetAllUserView()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: const Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Contacter-nous'),
            onTap: () => null,
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('aide & FAQs'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Don'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Tontine'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Enquete'),
            onTap: () => null,
          ),
          ListTile(
            title: const Text('Se deconnecter'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              data2.Cleanpref();
              //callbackFunctionlogout;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginView()));
            },
          ),
        ],
      ),
    );
  }
}
