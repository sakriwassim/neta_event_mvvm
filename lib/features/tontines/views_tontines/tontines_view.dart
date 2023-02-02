import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';
import '../../../core/colors.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../users/view_model_events/events_view_model.dart';
import '../view_model_tickets/tontines_view_model.dart';
import 'one_tontine_view.dart';
import 'widget/tontine_card_H_widget.dart';

class GetAllTontineView extends StatefulWidget {
  const GetAllTontineView({super.key});

  @override
  State<GetAllTontineView> createState() => _GetAllTontineViewState();
}

class _GetAllTontineViewState extends State<GetAllTontineView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<UsersViewModel>(context, listen: false).userConnected;
      Provider.of<TontinesViewModel>(context, listen: false).FetchAllTontines();
    });
  }

  // var data = TontinesViewModel();

  // var datauser = UsersViewModel();
  deletetontines(id) {
    setState(() {
      //  data.DeleteTontineByID(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provideruser = Provider.of<UsersViewModel>(context, listen: false);
    var providertontine =
        Provider.of<TontinesViewModel>(context, listen: false);

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
              "tontine détaille",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            // provideruser.userConnected!.roleId == "0"
            //     ? Container()
            //     :

            InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AddEventView()));
                },
                child: Button(
                  text: "ADD EVENT",
                  height: 40,
                  width: 100,
                  fontSize: 15,
                  gradientbackground: gradientbackground,
                  fontWeight: FontWeight.normal,
                  textcolor: Colors.white,
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
                // setState(() {
                //   data.FetchAllTontines();
                // });
                return Future.delayed(const Duration(seconds: 2));
              },
              child: Center(
                child: ListView.builder(
                    itemCount: providertontine.tontines.length,
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OnTontineView(
                                        tontine:
                                            providertontine.tontines[index],
                                        //  user: null,
                                      )));
                        },
                        child: TontineCardWidgetH(
                          image: '${providertontine.tontines[index].image}',
                          libelle: '${providertontine.tontines[index].libelle}',
                          montant_regulier:
                              "${providertontine.tontines[index].montant_regulier}\$",
                          nbr_participant:
                              '${providertontine.tontines[index].nbr_participant}',
                          periode: '',
                          status: '${providertontine.tontines[index].status}',
                          events: providertontine.tontines,
                          callbackFunction: deletetontines,
                          id: providertontine.tontines[index].id,
                        ))),
              ),
            );
          } else {
            return const Center(
              child: Text("no connection"),
            );
          }
        },
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
