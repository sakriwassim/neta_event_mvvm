import 'package:flutter/material.dart';

import '../../../core/string.dart';
import '../../authentification/authentification_repositories/authentification_api.dart';
import '../../authentification/view_model_authentification/authentification_view_model.dart';
import '../../events/views_events/events_view.dart';
import '../../packs/views_packs/packs_view.dart';
import '../../tontines/views_tontines/tontines_view.dart';
import '../../users/view_profil/user_view.dart';
import '../../users/views_events/events_view.dart';
import '../web_add_user_view.dart';
import '../web_view/login_signup_view.dart';

class HomeViewWeb extends StatefulWidget {
  HomeViewWeb({super.key});

  @override
  State<HomeViewWeb> createState() => _HomeViewWebState();
}

List<Widget> widget = [
  Container(
    color: Color.fromARGB(255, 214, 219, 224),
    //child: const AddEventView(),
  ),
  Container(
    color: const Color.fromARGB(255, 37, 243, 33),
    //  child: AddTontineView(),
  ),
  Container(
    color: const Color.fromARGB(255, 243, 33, 215),
    child: Column(
      children: [
        Expanded(
            child: Container(
          child: AddUserViewWeb(),
          color: Color.fromARGB(255, 33, 243, 131),
        )),
        Expanded(child: GetAllUserView()),
      ],
    ),
  ),
  Container(
    color: const Color.fromARGB(255, 243, 33, 215),
    child: GetAllEventView(),
  ),
  Container(
    color: Color.fromARGB(255, 110, 33, 243),
    //child: GetAllUserView(),
  ),
  Container(
    color: Color.fromARGB(255, 243, 54, 33),
    // child: GetAllUserView(),
  ),
  Container(
    color: Color.fromARGB(255, 33, 243, 79),
    child: GetAllPackView(),
  ),
  Container(
    color: Color.fromARGB(255, 93, 33, 243),
    child: GetAllTontineView(),
  ),
  Container(
    color: Color.fromARGB(255, 233, 243, 33),
    child: UserView(),
  ),
  Container(
    color: Color.fromARGB(255, 33, 243, 229),
  ),
  Container(
    color: Color.fromARGB(255, 142, 33, 243),
  )
];

class _HomeViewWebState extends State<HomeViewWeb> {
  int _select = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
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
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromARGB(255, 34, 255, 100),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromARGB(255, 12, 19, 235),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ),
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
                          child: widget[_select])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
