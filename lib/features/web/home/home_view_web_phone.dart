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
import '../web_sidebar_menu_widget.dart';
import '../web_view/login_signup_view.dart';

class HomeViewWebPhone extends StatefulWidget {
  HomeViewWebPhone({super.key});

  @override
  State<HomeViewWebPhone> createState() => _HomeViewWebPhoneState();
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

class _HomeViewWebPhoneState extends State<HomeViewWebPhone> {
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
        child: Container(
            color: const Color.fromARGB(255, 30, 206, 130),
            child: widget[_select]),
      ),
    );
  }
}
