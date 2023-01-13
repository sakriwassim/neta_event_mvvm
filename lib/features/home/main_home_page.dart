import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../events/evants_repositories/events_api.dart';
import '../events/view_model_events/events_view_model.dart';
import '../users/evants_repositories/events_api.dart';
import '../users/view_model_events/events_view_model.dart';
import 'bottom_agent.dart';
import 'bottom_navigation_bar.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  var data = EventsViewModel(eventsRepository: EventsApi());
  var datauser = UsersViewModel(eventsRepository: UsersApi());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      
        future: datauser.GetUserConnected(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: const CircularProgressIndicator());
          } else {
            var user = snapshot.data;
            // var userrole = user?.role_id.toString();
            var userrole = "4";
            return userrole == "4" ? MyHomePageAgent() : MyHomePageClient();
          }
        }));
  }
}
