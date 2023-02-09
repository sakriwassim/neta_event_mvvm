import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/features/home/widget/bottom_btn_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/authentification_view.dart';
import '../../core/colors.dart';
import '../../core/sidebar_widget/sidebar_menu_widget.dart';
import '../../core/size_config.dart';
import '../../core/string.dart';
import '../../core/widgets/coming_soon.dart';
import '../events/views_events/events_view.dart';
import '../tickets/views_tickets/tickets_view.dart';
import '../tontines/views_tontines/tontines_view.dart';
import '../users/view_model_events/users_view_model.dart';
import 'home_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  String userconnecedrole = "";
  List Screen = [
    HomeView(),
    const GetAllEventView(),
    const GetAllTicketView(),
    const GetAllTontineView(),
    const ComingSoon()
  ];
  List Screenagent = [
    HomeView(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeView();

  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<UsersViewModel>(context, listen: false).GetUserConnected();
    });
  }

  openDrawer() {
    _scaffoldState.currentState!.openDrawer();
  }

  navtohome() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);
    prefs.remove("userconnectedid");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => AuthView()));
  }

  Widget bottomwidget(
      String role, String iconoff, String iconon, String text, int Index) {
    return Expanded(
      child: role == "3"
          ? MaterialButton(
              minWidth: getProportionateScreenWidth(40),
              onPressed: () {
                setState(() {
                  if (Index == 0) {
                    currentScreen = Screenagent[Index];
                    _currentIndex = Index;
                  } else if (Index == 1) {
                    navtohome();
                  }
                });
              },
              child: bottomBtnwidget(
                Index: Index,
                currentIndex: _currentIndex,
                iconoff: iconoff,
                iconon: iconon,
                text: text,
              ),
            )
          : MaterialButton(
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

  Widget Buttombarwidget(String userconnecedrole) {
    if (userconnecedrole == "3") {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        bottomwidget(userconnecedrole, CompassOff, Compass, 'Découvrir', 0),
        bottomwidget(userconnecedrole, Deconnect, Deconnect, 'Deconnection', 1),
      ]);
    } else if (userconnecedrole == "1" ||
        userconnecedrole == "2" ||
        userconnecedrole == "0") {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        bottomwidget(userconnecedrole, CompassOff, Compass, 'Découvrir', 0),
        bottomwidget(userconnecedrole, Calendaroff, Calendar, 'Events', 1),
        bottomwidget(userconnecedrole, Locationoff, Location, 'Tickets', 2),
        bottomwidget(userconnecedrole, tontineoff, tontine, 'Tontine', 3),
        bottomwidget(userconnecedrole, Tontinoff, Tontin, 'Donation', 4),
      ]);
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    var provideruser = Provider.of<UsersViewModel>(context, listen: true);
    if (provideruser != null) {
      userconnecedrole = provideruser.userConnected?.roleId ?? "";
    }

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
      floatingActionButton: Visibility(
        visible: userconnecedrole == "3" ? true : false,
        child: FloatingActionButton(
            backgroundColor:
                const Color.fromARGB(116, 216, 4, 202).withOpacity(0.5),
            mini: false,
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => OneUserView()),
              // );
            },
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, gradient: gradientbackground),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset(
                  "assets/icons/home/scan.svg",
                  width: 28,
                ),
              ),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: getProportionateScreenHeight(70),
          child: Buttombarwidget(userconnecedrole),
        ),
      ),
    );
  }
}
