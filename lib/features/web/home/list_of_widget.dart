import 'package:flutter/material.dart';

import '../../events/views_events/events_view.dart';
import '../../packs/views_packs/packs_view.dart';
import '../../tontines/views_tontines/tontines_view.dart';
import '../../users/view_profil/user_view.dart';
import '../../users/views_events/events_view.dart';
import '../web_add_user_view.dart';

List<Widget> widgetweb = [
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
