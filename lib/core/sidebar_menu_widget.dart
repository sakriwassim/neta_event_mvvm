import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../features/authentification/authentification_repositories/authentification_api.dart';
import '../features/authentification/view_model_authentification/authentification_view_model.dart';
import '../features/authentification/views_authentification/login_authentification_view.dart';
import '../features/tontines/views_tontines/tontines_view.dart';
import '../features/users/evants_repositories/events_api.dart';
import '../features/users/view_model_events/events_view_model.dart';
import '../features/users/view_model_events/one_event_view_model.dart';
import '../features/users/view_profil/one_user_view.dart';
import '../features/users/views_events/events_view.dart';
import 'string.dart';

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
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.purple, Colors.pink]),
            ),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: FutureBuilder<OneUserViewModel>(
                    future: data.GetUserByID(1),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return CircleAvatar(
                          radius: 40.0,
                          backgroundImage: AdvancedNetworkImage(
                              snapshot.data!.image,
                              fallbackAssetImage: defaultImage),
                          backgroundColor: Colors.transparent,
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const CircularProgressIndicator();
                    }),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Alec Reynolds',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight + Alignment(0, .3),
                  child: Text(
                    'Flutter Youtuber',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight + Alignment(0, .8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'Verified',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(Profile), //Favoris
            title: Text('Profile',
                style: GoogleFonts.lato(
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    color: Colors.black)),
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
            leading: SvgPicture.asset(Favoris), //Favoris
            title: const Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: SvgPicture.asset(helpcircle), //Favoris
            title: const Text('Contacter-nous'),
            onTap: () => null,
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
          ),
          ListTile(
            leading: SvgPicture.asset(helpcircle),
            title: const Text('aide & FAQs'),
            onTap: () => null,
          ),
          ListTile(
            leading: SvgPicture.asset(Tontin),
            title: const Text('Don'),
            onTap: () => null,
          ),
          ListTile(
              leading: SvgPicture.asset(Tontin), //Tontin
              title: const Text('Tontine'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GetAllTontineView()));
              }),
          ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Enquete'),
              onTap: () {
                //  Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const GetAllTontineView()));
              }),
          ListTile(
            title: const Text('Se deconnecter'),
            leading: SvgPicture.asset(Deconnect),
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
