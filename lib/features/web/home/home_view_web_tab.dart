import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/web/home/list_of_widget.dart';

import '../../../core/sidebar_menu_widget.dart';
import '../../../core/string.dart';
import '../../authentification/authentification_repositories/authentification_api.dart';
import '../../authentification/view_model_authentification/authentification_view_model.dart';
import '../../events/views_events/events_view.dart';
import '../../packs/views_packs/packs_view.dart';
import '../../tontines/views_tontines/tontines_view.dart';
import '../../users/view_profil/user_view.dart';
import '../../users/views_events/events_view.dart';
import '../web_add_user_view.dart';
import '../web_sidebar_menu_widget.dart';
import '../web_view/login_signup_view.dart';

class HomeViewWebTab extends StatefulWidget {
  HomeViewWebTab({super.key});

  @override
  State<HomeViewWebTab> createState() => _HomeViewWebTabState();
}

class _HomeViewWebTabState extends State<HomeViewWebTab> {
  logout() {
    setState(() {
      //data2.Cleanpref();
    });
  }

  int _select = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final appBar = AppBar(
        // title: Row(
        //   children: [
        //     Container(
        //       height: 10,
        //       width: 10,
        //       color: const Color.fromARGB(255, 235, 12, 224),
        //       // child: Container(
        //       //   height: MediaQuery.of(context).size.height,
        //       //   child: Row(
        //       //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       //     children: [Image.asset(LoginImage), const Text(nameApp)],
        //       //   ),
        //       // ),
        //     ),
        //     Container(
        //       height: 10,
        //       width: 20,
        //       color: const Color.fromARGB(255, 34, 255, 100),
        //     ),
        //     Container(
        //       height: 10,
        //       width: 10,
        //       color: Color.fromARGB(255, 12, 19, 235),
        //     ),
        //     Container(
        //       height: 10,
        //       width: 10,
        //       color: Color.fromARGB(255, 235, 12, 12),
        //     ),
        //   ],
        // ),

        );

    final bodyHeight = screenHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    final bodyWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: WebSideBarMenu(
        callbackFunctionlogout: logout,
      ),
      appBar: appBar,
      body: Container(
        height: bodyHeight,
        width: bodyWidth,
        color: Colors.blue,
        child: Column(
          children: [
            Expanded(
              flex: 15,
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                              child: Center(
                            child: Container(
                                color: const Color.fromARGB(255, 179, 174, 202),
                                child: InkWell(
                                  child: const Text(
                                    "User name",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                )),
                          )),
                          Expanded(
                              child: Center(
                            child: Container(
                                color: const Color.fromARGB(255, 21, 214, 60),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _select = 0;
                                    });
                                  },
                                  child: const Text(
                                    "Dashboard",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                )),
                          )),
                          Expanded(
                              child: Center(
                            child: Container(
                                color: const Color.fromARGB(255, 188, 183, 211),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _select = 1;
                                    });
                                  },
                                  child: const Text(
                                    "Transactions",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                )),
                          )),
                          Expanded(
                              child: Center(
                            child: Container(
                                color: const Color.fromARGB(255, 14, 138, 113),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _select = 2;
                                    });
                                  },
                                  child: const Text(
                                    "Utilisateurs",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                )),
                          )),
                          Expanded(
                              child: Center(
                            child: Container(
                                color: const Color.fromARGB(255, 179, 174, 202),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _select = 3;
                                    });
                                  },
                                  child: const Text(
                                    "Event",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                )),
                          )),
                          Expanded(
                              child: Center(
                            child: Container(
                                color: const Color.fromARGB(255, 21, 214, 60),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _select = 4;
                                    });
                                  },
                                  child: const Text(
                                    "Donations",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                )),
                          )),
                          Expanded(
                              child: Center(
                            child: Container(
                                color: const Color.fromARGB(255, 188, 183, 211),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _select = 5;
                                    });
                                  },
                                  child: const Text(
                                    "Avie clients",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                )),
                          )),
                          Expanded(
                              child: Center(
                            child: Container(
                                color: const Color.fromARGB(255, 14, 138, 113),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _select = 6;
                                    });
                                  },
                                  child: const Text(
                                    "Packs publicite",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                )),
                          )),
                          Expanded(
                              child: Center(
                            child: Container(
                                color: const Color.fromARGB(255, 179, 174, 202),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _select = 7;
                                    });
                                  },
                                  child: const Text(
                                    "Tontine",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                )),
                          )),
                          Expanded(
                              child: Center(
                            child: Container(
                                color: const Color.fromARGB(255, 21, 214, 60),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _select = 8;
                                    });
                                  },
                                  child: const Text(
                                    "Profile",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                )),
                          )),
                          Expanded(
                            child: Center(
                              child: Container(
                                child: InkWell(
                                  onTap: () {
                                    AuthentificationViewModel(
                                            authentificationRepository:
                                                AuthentificationApi())
                                        .Cleanpref();

                                    //callbackFunctionlogout;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginSignupView()));
                                    // setState(() {
                                    //   _select = 9;
                                    // });
                                  },
                                  child: const Text(
                                    "Logout",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Center(
                            child: Container(
                                color: const Color.fromARGB(255, 14, 138, 113),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _select = 10;
                                    });
                                  },
                                  child: const Text(
                                    "Copyright 2022",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                )),
                          )),
                        ],
                      )),
                  Expanded(
                      flex: 8,
                      child: Container(
                          color: const Color.fromARGB(255, 30, 206, 130),
                          child: widgetweb[_select])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
