import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../../core/widgets/small_button_style.dart';
import '../tontines_repositories/tontines_api.dart';
import '../view_model_tickets/one_tontine_view_model.dart';
import '../view_model_tickets/tontines_view_model.dart';
import 'add_tontine_view.dart';
import 'one_tontine_view.dart';
import 'widget/tontine_card_H_widget.dart';

class GetAllTontineView extends StatefulWidget {
  const GetAllTontineView({super.key});

  @override
  State<GetAllTontineView> createState() => _GetAllTontineViewState();
}

class _GetAllTontineViewState extends State<GetAllTontineView> {
  var data = TontinesViewModel(ticketsRepository: TontinesApi());

  deletetontines(id) {
    setState(() {
      data.DeleteTontineByID(id);
    });
  }

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
                          builder: (context) => AddTontineView()));
                },
                child: SmallButton(text: "ADD EVENT")),
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
                  data.FetchAllTontines();
                });

                return Future.delayed(const Duration(seconds: 2));
              },
              child: Center(
                child: FutureBuilder<List<OneTontineViewModel>>(
                  future: data.FetchAllTontines(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      var tickets = snapshot.data;
                      return ListView.builder(
                          itemCount: tickets?.length,
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OnTontineView(
                                              id: tickets[index].id,
                                            )));
                              },
                              child: TontineCardWidgetH(
                                image: "assets/125.png",
                                libelle: '${tickets![index].libelle}',
                                montant_regulier:
                                    "${tickets[index].montant_regulier}\$",
                                nbr_participant:
                                    '${tickets[index].nbr_participant}',
                                periode: '',
                                status: '${tickets[index].status}',
                                events: tickets,
                                callbackFunction: deletetontines,
                                id: tickets[index].id,
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
