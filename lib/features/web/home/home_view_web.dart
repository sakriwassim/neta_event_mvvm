import 'package:flutter/material.dart';

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
import '../web_authentification_view/login_signup_web_view.dart';
import 'list_of_widget.dart';

class HomeViewWeb extends StatefulWidget {
  HomeViewWeb({super.key});

  @override
  State<HomeViewWeb> createState() => _HomeViewWebState();
}

class _HomeViewWebState extends State<HomeViewWeb> {
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

    final bodyHeight = screenHeight - MediaQuery.of(context).padding.top;
    final bodyWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: bodyHeight,
        width: bodyWidth,
        color: Colors.blue,
        child: Column(
          children: [
            Container(
              height: bodyHeight * 0.1,
              width: bodyWidth,
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: bodyWidth * 0.2,
                    color: const Color.fromARGB(255, 235, 12, 224),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(LoginImage),
                          const Text(nameApp)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: bodyWidth * 0.6,
                    color: Color.fromARGB(255, 34, 255, 100),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: bodyWidth * 0.1,
                    color: Color.fromARGB(255, 12, 19, 235),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: bodyWidth * 0.1,
                    color: Colors.deepOrange,
                  ),
                ],
              ),
            ),
            Container(
              height: bodyHeight * 0.9,
              child: Row(
                children: [
                  Container(
                      width: bodyWidth * 0.2,
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
                                                LoginSignupViewWeb()));
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
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Container(
                                  color:
                                      const Color.fromARGB(255, 14, 138, 113),
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
                            ),
                          ),
                        ],
                      )),
                  Container(
                      width: bodyWidth * 0.8,
                      color: const Color.fromARGB(255, 30, 206, 130),
                      child: widgetweb[_select]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
