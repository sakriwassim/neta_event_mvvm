import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/login_authentification_view.dart';
import 'package:neta_event_mvvm/features/home/home_view_agent.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/colors.dart';
import '../../core/sidebar_widget/sidebar_menu_widget.dart';
import '../../core/size_config.dart';
import '../authentification/authentification_repositories/authentification_api.dart';
import '../authentification/view_model_authentification/authentification_view_model.dart';
import '../events/evants_repositories/events_api.dart';
import '../events/view_model_events/events_view_model.dart';
import '../events/views_events/events_view.dart';
import '../tickets/views_tickets/tickets_view.dart';
import '../tontines/views_tontines/tontines_view.dart';
import '../users/view_profil/one_user_view.dart';
import 'home_view.dart';

class MyHomePageAgent extends StatefulWidget {
  const MyHomePageAgent({super.key});

  @override
  _MyHomePageAgentState createState() => _MyHomePageAgentState();
}

class _MyHomePageAgentState extends State<MyHomePageAgent> {
  var data = EventsViewModel(eventsRepository: EventsApi());

  int _currentIndex = 0;

  List Screen = [
    HomeViewAgent(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeViewAgent();

  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  var dataAuthentificationViewModel = AuthentificationViewModel(
      authentificationRepository: AuthentificationApi());

  navtologin() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);
    prefs.remove("token");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginView()));
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
                "assets/icons/home/scan.svg",
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
              Expanded(
                child: MaterialButton(
                  minWidth: getProportionateScreenWidth(40),
                  onPressed: () {
                    setState(() {
                      currentScreen = Screen[0];
                      _currentIndex = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SvgPicture.asset("$image"),
                      SizedBox(
                        height: getProportionateScreenHeight(27),
                        child: SvgPicture.asset(
                          _currentIndex == 0
                              ? "assets/icons/home/compass.svg" //  "assets/icons/home/Calendar.svg"
                              : "assets/icons/home/compassof.svg",
                          width: getProportionateScreenWidth(28),
                        ),
                      ),

                      Text(
                        'Découvrir',
                        style: TextStyle(
                          fontFamily: 'AirbnbCereal',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          foreground: _currentIndex == 0
                              ? (Paint()..shader = linearGradient)
                              : Paint()
                            ..color = Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: getProportionateScreenWidth(40),
                  onPressed: () {
                    navtologin();
                    // setState(() {
                    //   currentScreen = Screen[1];
                    //   _currentIndex = 1;
                    // });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(27),
                        child: SvgPicture.asset(
                          _currentIndex == 1
                              ? "assets/icons/home/Calendar.svg"
                              : "assets/icons/home/Deconnect.svg",
                          width: getProportionateScreenWidth(28),
                        ),
                      ),
                      Text(
                        'Deconnection',
                        style: TextStyle(
                          fontFamily: 'AirbnbCereal',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          foreground: _currentIndex == 1
                              ? (Paint()..shader = linearGradient)
                              : Paint()
                            ..color = Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
