import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:neta_event_mvvm/core/widgets/small_button_style.dart';

import '../packs_repositories/packs_api.dart';
import '../view_model_packs/one_pack_view_model.dart';
import '../view_model_packs/packs_view_model.dart';
import 'add_pack_view.dart';
import 'update_pack_view.dart';

class GetAllPackView extends StatefulWidget {
  const GetAllPackView({super.key});

  @override
  State<GetAllPackView> createState() => _GetAllPackViewState();
}

class _GetAllPackViewState extends State<GetAllPackView> {
  var data = PacksViewModel(packsRepository: PacksApi());

  alertupdate(OnePackViewModel obj) => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('êtes-vous sûr!!'),
          content: const Text('de mettre à jour la valeur de compteur'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'MODIFY');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdatePackView(eventObj: obj)));
              },
              child: const Text('MODIFY'),
            ),
            TextButton(
                child: const Text('DELETE'),
                onPressed: () {
                  Navigator.pop(context, 'DELETE');
                  setState(() {
                    data.DeletePackByID(obj.id);
                  });
                }),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.title,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPackView()));
                },
                child: SmallButton(text: "ADD PACK")),
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
                  data.FetchAllPacks();
                });

                return Future.delayed(Duration(seconds: 2));
              },
              child: Center(
                child: FutureBuilder<List<OnePackViewModel>>(
                  future: data.FetchAllPacks(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      var events = snapshot.data;
                      return ListView.builder(
                          itemCount: events?.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  alertupdate(events![index]);
                                },
                                child: ListTile(
                                  title: Text("${events![index].libelle}",
                                      style: TextStyle(
                                          fontFamily: 'AirbnbCereal',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 211, 7, 194))),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("${events![index].updated_at}",
                                          style: TextStyle(
                                            fontFamily: 'AirbnbCereal',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                                "${events![index].updated_at}" +
                                                    "€",
                                                style: TextStyle(
                                                  fontFamily: 'AirbnbCereal',
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  leading: Image.asset(
                                    "assets/125.png",
                                  ),
                                ),
                              ));
                    }
                  }),
                ),
              ),
            );
          } else {
            return Center(
              child: Text("no connection"),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'There are no bottons to push :)',
            ),
            new Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}
