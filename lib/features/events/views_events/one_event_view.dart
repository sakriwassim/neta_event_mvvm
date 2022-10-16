import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/one_event_view_model.dart';
import 'package:neta_event_mvvm/features/events/views_events/update_event_view.dart';

import '../../../core/widgets/big_button_style.dart';
import '../evants_repositories/events_api.dart';
import '../view_model_events/events_view_model.dart';
import 'events_view.dart';

class OnEventView extends StatefulWidget {
  final int id;
  OnEventView({super.key, required this.id});

  @override
  State<OnEventView> createState() => _OnEventViewState();
}

class _OnEventViewState extends State<OnEventView> {
  var data = EventsViewModel(eventsRepository: EventsApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          shadowColor: Colors.white,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            "Event details",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Center(
        child: FutureBuilder<OneEventViewModel>(
          future: data.GetEventByID(widget.id),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Image.asset("assets/130.png"),
                  Text(snapshot.data!.libelle),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 50.0,
                          color: Color.fromARGB(255, 217, 15, 197),
                        ),
                        Text("${snapshot.data!.date_heure} "),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.map,
                          size: 50.0,
                          color: Color.fromARGB(255, 217, 15, 197),
                        ),
                        Text("${snapshot.data!.adresse}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("participants actuels"),
                        Text("${snapshot.data!.status}"),
                      ],
                    ),
                  ),
                  Text("Next Owner"),
                  Container(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                          'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateEventView(
                                          eventObj: snapshot.data!,
                                        )));
                          },
                          child: BigButton(text: "MODIFIER")),
                      InkWell(
                          onTap: () async {
                            var delete =
                                await data.DeleteEventByID(snapshot.data!.id);

                            if (delete == true) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GetAllEventView()));
                            }
                          },
                          child: BigButton(text: "SUPPRIMER")),
                    ],
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          }),
        ),
      ),
    );
  }
}
