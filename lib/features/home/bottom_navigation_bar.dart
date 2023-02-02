// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/home/widget/bottom_btn_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:neta_event_mvvm/features/authentification/views_authentification/authentification_view.dart';

import '../../core/sidebar_widget/sidebar_menu_widget.dart';
import '../../core/size_config.dart';
import '../../core/string.dart';
import '../../core/widgets/coming_soon.dart';
import '../events/views_events/events_view.dart';
import '../tickets/views_tickets/tickets_view.dart';
import '../tontines/views_tontines/tontines_view.dart';
import 'home_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  // List Screen2 = [
  //   HomeViewAgent(),
  // ];

  List<Widget> Screen = [
    HomeView(),
    const GetAllEventView(),
    GetAllTicketView(),
    GetAllTontineView(),
    ComingSoon()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeView();

  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  openDrawer() {
    _scaffoldState.currentState!.openDrawer();
  }

  navtohome() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);
    prefs.remove("token");
    prefs.remove("token");
    prefs.remove("userconnectedid");

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
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
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
              bottomwidget(tontineoff, tontine, 'Tontine', 3),
              bottomwidget(Tontinoff, Tontin, 'Donation', 4),
            ],
          ),

//  Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               bottomwidget(CompassOff, Compass, 'Découvrir', 0),
//               bottomwidget(Deconnect, Deconnect, 'Deconnection', 1),
//             ],
//           ),
        ),
      ),
    );
  }
}
