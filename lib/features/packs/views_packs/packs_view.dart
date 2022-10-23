import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../tickets/views_tickets/widget/pack_card_widget.dart';
import '../packs_repositories/packs_api.dart';
import '../view_model_packs/one_pack_view_model.dart';
import '../view_model_packs/packs_view_model.dart';

class GetAllPackView extends StatefulWidget {
  const GetAllPackView({super.key});

  @override
  State<GetAllPackView> createState() => _GetAllPackViewState();
}

class _GetAllPackViewState extends State<GetAllPackView> {
  var data = PacksViewModel(packsRepository: PacksApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme:const IconThemeData(
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

                return Future.delayed(const Duration(seconds: 2));
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
                                onTap: () {},
                                child: PackCardWidget(
                                  libelle: '${events![index].libelle}',
                                ),
                              ));
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
          children:const<Widget>[
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
