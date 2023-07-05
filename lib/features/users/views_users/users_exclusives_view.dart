import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:neta_event_mvvm/core/widgets/small_button_style.dart';
import 'package:neta_event_mvvm/features/users/views_users/widgets/event_card_widget.dart';

import '../../../core/colors.dart';
import '../models_users/event_model.dart';
import '../view_model_events/users_view_model.dart';
import 'add_user_view.dart';
import 'one_user_view.dart';

class GetExcusivesUserView extends StatefulWidget {
  const GetExcusivesUserView ({Key? key}) : super(key: key);

  @override
  State<GetExcusivesUserView> createState() => _GetExcusivesUserViewState();
}

class _GetExcusivesUserViewState extends State<GetExcusivesUserView> {
  var data = UsersViewModel();

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
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddUserView()));
                },
                child: Button(
                  text: "ADD EVENT",
                  height: 40,
                  width: 100,
                  fontSize: 15,
                  gradientbackground: gradientbackground,
                  fontWeight: FontWeight.normal, textcolor:  Colors.white,
                )),
          ],
        ),
      ),
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
                child: FutureBuilder<List<UserModel>>(
                  //future: data.GetUserByCategorie(2),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
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
                                            id: events![index].id!,
                                          )),
                                );
                              },
                              child: UserCardWidget(
                                description: events![index].adresse,
                                events: events,
                                date_heure: events[index].adresse,
                                libelle: events[index].nomComplet,
                                prix: events[index].telephone.toString(),
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
