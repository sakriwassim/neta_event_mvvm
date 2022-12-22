// ignore_for_file: public_member_api_docs, sort_constructors_first
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
import 'colors.dart';
import 'string.dart';
import 'widgets/text_widget_text1.dart';

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
              color: Colors.white,
              // gradient: gradientbackground,
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
                Align(
                  alignment: Alignment.centerRight,
                  child: TextAirbnbCereal(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    size: 19,
                    title: 'Alec Reynolds',
                  ),
                ),
                Align(
                  alignment: const Alignment(0, .3),
                  child: TextAirbnbCereal(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    size: 14,
                    title: 'Client',
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(Profile), //Favoris
            title: TextAirbnbCereal(
              title: 'Profile',
              color: Colors.black,
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OneUserView()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(calendarside),
            title: TextAirbnbCereal(
              title: 'Eléments',
              color: Colors.black,
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GetAllUserView()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(Favoris), //Favoris
            title: TextAirbnbCereal(
              title: 'Favorites',
              color: Colors.black,
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            onTap: () => null,
          ),
          ListTile(
            leading: SvgPicture.asset(message), //Favoris
            title: TextAirbnbCereal(
              title: 'Contacter-nous',
              color: Colors.black,
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            onTap: () => null,
          ),
          ListTile(
            leading: SvgPicture.asset(helpcircle),
            title: TextAirbnbCereal(
              title: 'aide & FAQs',
              color: Colors.black,
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            onTap: () => null,
          ),
          ListTile(
            leading: SvgPicture.asset(Tontin),
            title: TextAirbnbCereal(
              title: 'Don',
              color: Colors.black,
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            onTap: () => null,
          ),
          ListTile(
              leading: SvgPicture.asset(Tontin), //Tontin
              title: TextAirbnbCereal(
                title: 'Tontine',
                color: Colors.black,
                size: 16,
                fontWeight: FontWeight.w400,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GetAllTontineView()));
              }),
          ListTile(
              leading: SvgPicture.asset(calendarside),
              title: TextAirbnbCereal(
                title: 'Enquete',
                color: Colors.black,
                size: 16,
                fontWeight: FontWeight.w400,
              ),
              onTap: () {
                //  Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const GetAllTontineView()));
              }),
          ListTile(
            title: TextAirbnbCereal(
              title: 'Se deconnecter',
              color: Colors.black,
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            leading: SvgPicture.asset(Deconnect),
            onTap: () {
              data2.Cleanpref();
              //callbackFunctionlogout;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginView()));
            },
          ),
        ],
      ),
    );
  }
}
