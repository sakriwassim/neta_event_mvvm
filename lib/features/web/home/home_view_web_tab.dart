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
import '../my_drawer_header.dart';
import '../web_add_user_view.dart';
import '../web_sidebar_menu_widget.dart';
import '../web_view/login_signup_view.dart';

class HomeViewWebTab extends StatefulWidget {
  HomeViewWebTab({super.key});

  @override
  State<HomeViewWebTab> createState() => _HomeViewWebTabState();
}

class _HomeViewWebTabState extends State<HomeViewWebTab> {
  var currentPage = DrawerSections.dashboard;
  logout() {
    setState(() {
      //data2.Cleanpref();
    });
  }

  int _select = 0;

  @override
  Widget build(BuildContext context) {
    var container;
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
    if (currentPage == DrawerSections.dashboard) {
      container = Container(
        child: Text("dashboard"),
        color: Colors.blue,
      );
    } else if (currentPage == DrawerSections.contacts) {
      container = Container(
        child: Text("contacts"),
        color: Color.fromARGB(255, 243, 33, 212),
      );
    } else if (currentPage == DrawerSections.events) {
      container = Container(
        child: Text("events"),
        color: Color.fromARGB(255, 233, 33, 243),
      );
    } else if (currentPage == DrawerSections.notes) {
      container = Container(
        child: Text("notes"),
        color: Colors.blue,
      );
    } else if (currentPage == DrawerSections.settings) {
      container = Container(
        child: Text("settings"),
        color: Colors.blue,
      );
    } else if (currentPage == DrawerSections.notifications) {
      container = Container(
        child: Text("notifications"),
        color: Colors.blue,
      );
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = Container(
        child: Text("privacy_policy"),
        color: Colors.blue,
      );
    } else if (currentPage == DrawerSections.send_feedback) {
      container = Container(
        child: Text("send_feedback"),
        color: Colors.blue,
      );
    }

    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),

      // WebSideBarMenu(
      //   callbackFunctionlogout: logout,
      // ),
      appBar: appBar,
      body: container,
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Notes", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
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

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
