import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/sidebar_widget/sidebar_head_widget.dart';
import '../../features/authentification/views_authentification/authentification_view.dart';
import '../../features/events/views_events/events_view.dart';
import '../../features/tontines/views_tontines/tontines_view.dart';
import '../../features/users/view_profil/one_user_view.dart';
import '../size_config.dart';
import '../string.dart';
import '../widgets/text_widget_text1.dart';

class SideBarMenu extends StatelessWidget {
  Function? callbackFunctionlogout;
  String imagepath = "";

  SideBarMenu({
    Key? key,
    required this.callbackFunctionlogout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    comingsoon() {
      showGeneralDialog(
        context: context,
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextAirbnbCereal(
                      color: Color.fromARGB(255, 6, 222, 196), //4F4F4F
                      fontWeight: FontWeight.w500,
                      size: 18,
                      title: "Bientôt Disponible",
                    ),
                    Container(
                      height: 150,
                      child: Image.asset(
                        coming_soon
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          Tween<Offset> tween;
          if (anim.status == AnimationStatus.reverse) {
            tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
          } else {
            tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
          }

          return SlideTransition(
            position: tween.animate(anim),
            child: FadeTransition(
              opacity: anim,
              child: child,
            ),
          );
        },
      );
    }

    SizeConfig().init(context);
    return Drawer(
      width: getProportionateScreenWidth(200),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: ListView(
        children: [
          const SideHeader(),
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
              title: 'Événements',
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
            leading: SvgPicture.asset(Tontinoffsidebar),
            title: TextAirbnbCereal(
              title: 'Don',
              color: Colors.black,
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            onTap: () => comingsoon(),
          ),
          ListTile(
              leading: SvgPicture.asset(
                tontineoff,
                height: 30,
                width: 30,
              ), //Tontin
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
            leading: SvgPicture.asset(Favoris), //Favoris
            title: TextAirbnbCereal(
              title: 'Favorites',
              color: Colors.black,
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            onTap: () => comingsoon(),
          ),
          ListTile(
            leading: SvgPicture.asset(message), //Favoris
            title: TextAirbnbCereal(
              title: 'Contacter-nous',
              color: Colors.black,
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            onTap: () => comingsoon(),
          ),
          ListTile(
            leading: SvgPicture.asset(helpcircle),
            title: TextAirbnbCereal(
              title: 'Aide et Service',
              color: Colors.black,
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            onTap: () => comingsoon(),
          ),
          ListTile(
            title: TextAirbnbCereal(
              title: 'Se déconnecter',
              color: Colors.black,
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            leading: SvgPicture.asset(Deconnect),
            onTap: () {
              callbackFunctionlogout;
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => AuthView()));
            },
          ),
        ],
      ),
    );
  }
}
