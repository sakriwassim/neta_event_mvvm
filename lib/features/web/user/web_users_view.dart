import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:neta_event_mvvm/core/widgets/small_button_style.dart';
import 'package:neta_event_mvvm/features/users/views_events/widgets/event_card_widget.dart';

import '../../../core/colors.dart';
import '../../users/evants_repositories/events_api.dart';
import '../../users/view_model_events/events_view_model.dart';
import '../../users/view_model_events/one_event_view_model.dart';
import '../../users/views_events/one_event_view.dart';

class GetAllUserViewWeb extends StatefulWidget {
  const GetAllUserViewWeb({super.key});

  @override
  State<GetAllUserViewWeb> createState() => _GetAllUserViewWebState();
}

class _GetAllUserViewWebState extends State<GetAllUserViewWeb> {
  var data = UsersViewModel(eventsRepository: UsersApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  data.GetUserByCategorie(2);
                });

                return Future.delayed(const Duration(seconds: 2));
              },
              child: Center(
                child: FutureBuilder<List<OneUserViewModel>>(
                  future: data.FetchAllUsers(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      var events = snapshot.data;
                      return ListView.builder(
                          itemCount: events?.length,
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OnUserView(
                                            id: events[index].id,
                                          )),
                                );
                              },
                              child: UserCardWidget(
                                description: events![index].adresse,
                                events: events,
                                date_heure: events[index].adresse,
                                libelle: events[index].nom_complet,
                                prix: events[index].email,
                                adresse: events[index].adresse,
                              )));
                    }
                  }),
                ),
              ),
            );
          } else {
            return const Center(
              child: Text("no connection"),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'There are no bottons to push :)',
            ),
            Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}
