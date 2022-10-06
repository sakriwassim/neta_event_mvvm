import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:neta_event_mvvm/features/events/models_events/add_event_model.dart';
import 'package:neta_event_mvvm/features/events/views_events/add_event_view.dart';
import 'package:neta_event_mvvm/features/events/views_events/events_view.dart';

import 'home_view.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  List Screen = [
    HomeView(),
    GetAllEventView(),
    Container(
      color: Color.fromARGB(255, 241, 18, 167),
    ),
    Container(
      color: Color.fromARGB(255, 241, 18, 167),
    )
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Customerdetails(),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
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
                      'Découvrir ',
                      style: TextStyle(
                        color: _currentIndex == 0
                            ? Color(0xffD2286A)
                            : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
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
                    Icon(Icons.event_outlined, color: Colors.grey),
                    Text(
                      'Events',
                      style: TextStyle(
                        color: _currentIndex == 1
                            ? Color(0xffD2286A)
                            : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
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
                    Icon(Icons.add_location_outlined, color: Colors.grey),
                    Text(
                      'Tickets',
                      style: TextStyle(
                        color: _currentIndex == 2
                            ? Color(0xffD2286A)
                            : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
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
                    Icon(
                      Icons.logout_outlined,
                      color: Colors.grey,
                    ),
                    Text(
                      'Déconnecter',
                      style: TextStyle(
                          color: _currentIndex == 3
                              ? Color(0xffD2286A)
                              : Colors.grey),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
