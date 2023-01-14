import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:neta_event_mvvm/core/widgets/small_button_style.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/events_api.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/events_view_model.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/one_event_view_model.dart';
import 'package:neta_event_mvvm/features/events/views_events/add_event_view.dart';
import 'package:neta_event_mvvm/features/events/views_events/widgets/event_card_widget_home.dart';

import '../../../core/colors.dart';
import '../../users/evants_repositories/events_api.dart';
import '../../users/view_model_events/events_view_model.dart';
import 'events_body_view.dart';
import 'one_event_view.dart';

class GetAllEventView extends StatefulWidget {
  const GetAllEventView({super.key});

  @override
  State<GetAllEventView> createState() => _GetAllEventViewState();
}

class _GetAllEventViewState extends State<GetAllEventView> {
  var data = EventsViewModel(eventsRepository: EventsApi());
  var datauser = UsersViewModel(eventsRepository: UsersApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          shadowColor: Colors.white,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              FutureBuilder(
                  future: datauser.GetUserConnected(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    } else {
                      //var body = snapshot.data;
                      var role = snapshot.data!.role_id.toString();
                      return role == "0"
                          ? Container()
                          : InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddEventView()));
                              },
                              child: Button(
                                text: "ADD EVENT",
                                height: 40,
                                width: 100,
                                fontSize: 15,
                                gradientbackground: gradientbackground,
                                fontWeight: FontWeight.normal,
                                textcolor: Colors.white,
                              ));
                    }
                  }),
            ],
          ),
        ),
        body: GetAllEventViewBody());
  }
}
