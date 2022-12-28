import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/sidebar_widget/sidebar_head_widget.dart';
import '../../features/authentification/authentification_repositories/authentification_api.dart';
import '../../features/authentification/view_model_authentification/authentification_view_model.dart';
import '../../features/authentification/views_authentification/login_authentification_view.dart';
import '../../features/events/views_events/events_view.dart';
import '../../features/tontines/views_tontines/tontines_view.dart';
import '../../features/users/evants_repositories/events_api.dart';
import '../../features/users/view_model_events/events_view_model.dart';
import '../../features/users/view_profil/one_user_view.dart';
import '../size_config.dart';
import '../string.dart';
import '../widgets/text_widget_text1.dart';

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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      width: getProportionateScreenWidth(200),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: ListView(
        children: [
          SideHeader(),
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
                      builder: (context) => const GetAllEventView()));
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
            leading: SvgPicture.asset(Tontinoffsidebar),
            title: TextAirbnbCereal(
              title: 'Don',
              color: Colors.black,
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            onTap: () => null,
          ),
          ListTile(
              leading: SvgPicture.asset(Tontinoffsidebar), //Tontin
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
