import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/colors.dart';
import '../events/evants_repositories/events_api.dart';
import '../events/view_model_events/events_view_model.dart';
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
  var data = EventsViewModel(eventsRepository: EventsApi());

  int _currentIndex = 0;

  List Screen = [
    HomeView(),
    const GetAllEventView(),
    const GetAllTicketView(),
    const GetAllTontineView(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        mini: false,
        backgroundColor: Color.fromARGB(138, 225, 8, 142),
        onPressed: () {},
        elevation: 10,
        child: SvgPicture.asset(
          "assets/icons/home/Profile.svg",
          width: 28,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
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
                      SvgPicture.asset(
                        _currentIndex == 0
                            ? "assets/icons/home/compass.svg" //  "assets/icons/home/Calendar.svg"
                            : "assets/icons/home/compassof.svg",
                        width: 28,
                      ),
                      Text(
                        'Découvrir',
                        style: TextStyle(
                          color: _currentIndex == 0
                              ? const Color(0xffD2286A)
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = Screen[1];
                      _currentIndex = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        _currentIndex == 1
                            ? "assets/icons/home/Calendar.svg"
                            : "assets/icons/home/Calendaroff.svg",
                        width: 28,
                      ),
                      Text(
                        'Events',
                        style: TextStyle(
                          color: _currentIndex == 1
                              ? const Color(0xffD2286A)
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = Screen[2];
                      _currentIndex = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        _currentIndex == 2
                            ? "assets/icons/home/Location.svg"
                            : "assets/icons/home/Locationoff.svg", //Profile
                        width: 28,
                      ),
                      Text(
                        'Tickets',
                        style: TextStyle(
                          color: _currentIndex == 2
                              ? const Color(0xffD2286A)
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = Screen[3];
                      _currentIndex = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.attach_money,
                        color: Colors.grey,
                      ),
                      Text(
                        'Tontine',
                        style: TextStyle(
                            color: _currentIndex == 3
                                ? const Color(0xffD2286A)
                                : Colors.grey),
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
