// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/features/home/widget/bottom_btn_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:neta_event_mvvm/features/authentification/views_authentification/authentification_view.dart';

import '../../core/colors.dart';
import '../../core/sidebar_widget/sidebar_menu_widget.dart';
import '../../core/size_config.dart';
import '../../core/string.dart';
import '../authentification/authentification_repositories/authentification_api.dart';
import '../authentification/view_model_authentification/authentification_view_model.dart';
import '../events/evants_repositories/events_api.dart';
import '../events/view_model_events/events_view_model.dart';
import '../events/views_events/events_view.dart';
import '../tickets/views_tickets/tickets_view.dart';
import '../tontines/views_tontines/tontines_view.dart';
import '../users/evants_repositories/events_api.dart';
import '../users/view_model_events/events_view_model.dart';
import '../users/view_profil/one_user_view.dart';
import 'bottom_agent.dart';
import 'home_view.dart';
import 'home_view_agent.dart';

class MyHomePageClient extends StatefulWidget {
  const MyHomePageClient({super.key});

  @override
  _MyHomePageClientState createState() => _MyHomePageClientState();
}

class _MyHomePageClientState extends State<MyHomePageClient> {
  var data = EventsViewModel(eventsRepository: EventsApi());
  var datauser = UsersViewModel(eventsRepository: UsersApi());

  int _currentIndex = 0;

  List Screen = [
    HomeView(),
    const GetAllEventView(),
    GetAllTicketView(),
    const GetAllTontineView(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeView();

  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  var dataAuthentificationViewModel = AuthentificationViewModel(
      authentificationRepository: AuthentificationApi());

  openDrawer() {
    _scaffoldState.currentState!.openDrawer();
  }

  navtohome() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);
    prefs.remove("token");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => AuthView()));
  }

  Widget bottomwidget(String iconoff, String iconon, String text, int Index) {
    return Expanded(
      child: MaterialButton(
        minWidth: getProportionateScreenWidth(40),
        onPressed: () {
          setState(() {
            currentScreen = Screen[Index];
            _currentIndex = Index;
          });
        },
        child: bottomBtnwidget(
          Index: Index,
          currentIndex: _currentIndex,
          iconoff: iconoff,
          iconon: iconon,
          text: text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      key: _scaffoldState,
      drawer: SideBarMenu(
        callbackFunctionlogout: navtohome,
      ),
      backgroundColor: Colors.white,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(116, 216, 4, 202).withOpacity(0.5),
          mini: false,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OneUserView()),
            );
          },
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, gradient: gradientbackground),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(
                ProfileBnt,
                width: 28,
              ),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: getProportionateScreenHeight(70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomwidget(CompassOff, Compass, 'Découvrir', 0),
              bottomwidget(Calendaroff, Calendar, 'Events', 1),
              bottomwidget(Locationoff, Location, 'Tickets', 2),
              bottomwidget(Tontinoff, Tontin, 'Tontine', 3),
            ],
          ),
        ),
      ),
    );
  }
}
