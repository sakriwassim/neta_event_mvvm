import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:neta_event_mvvm/features/users/views_users/widgets/event_card_widget.dart';

import '../../../core/size_config.dart';
import '../models_users/event_model.dart';
import '../view_model_events/users_view_model.dart';
import 'one_event_view.dart';

class GetAllUserView extends StatefulWidget {
  const GetAllUserView({super.key});

  @override
  State<GetAllUserView> createState() => _GetAllUserViewState();
}

class _GetAllUserViewState extends State<GetAllUserView> {
  var data = UsersViewModel();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: screenHeight,
        child: OfflineBuilder(
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
                    //future: data.FetchAllUsers(),
                    builder: ((context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        var events = snapshot.data;
                        return ListView.builder(
                            itemCount: events?.length,
                            itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OnUserView(
                                              id: events[index].id!,
                                            )),
                                  );
                                },
                                child: UserCardWidget(
                                  description: events![index].adresse,
                                  events: events,
                                  date_heure: events[index].adresse,
                                  libelle: events[index].nomComplet,
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
          child: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
