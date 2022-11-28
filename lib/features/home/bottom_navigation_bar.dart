import 'package:flutter/material.dart';

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
        child: const Icon(Icons.add),
        onPressed: () {},
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
                      Image.asset(
                        _currentIndex == 0
                            ? "assets/discover_icon.png"
                            : "assets/discover_icon_not_filled.png",
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
                      const Icon(Icons.event_outlined, color: Colors.grey),
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
                      const Icon(Icons.add_location_outlined,
                          color: Colors.grey),
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
