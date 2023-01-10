import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neta_event_mvvm/core/widgets/text_widget_text1.dart';
import '../../../core/colors.dart';
import '../../../core/string.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../tontines/tontines_repositories/tontines_api.dart';
import '../../tontines/view_model_tickets/one_tontine_view_model.dart';
import '../../tontines/view_model_tickets/tontines_view_model.dart';
import 'one_notification_view.dart';
import 'widget/notification_card_widget.dart';

class GetAllNotificationView extends StatefulWidget {
  const GetAllNotificationView({super.key});

  @override
  State<GetAllNotificationView> createState() => _GetAllNotificationViewState();
}

class _GetAllNotificationViewState extends State<GetAllNotificationView> {
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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AddTontineView()));
                },
                child: Button(
                  fontWeight: FontWeight.normal,
                  text: "VIDER",
                  height: 40,
                  width: 100,
                  fontSize: 15,
                  gradientbackground: gradientbackground,
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
                setState(() {
                  data.FetchAllTontines();
                });

                return Future.delayed(const Duration(seconds: 2));
              },
              child: Center(
                child: FutureBuilder<List<OneTontineViewModel>>(
                  future: data.FetchAllTontines(),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    } else {
                      //var tickets = snapshot.data;
                      var tickets = [];
                      if (tickets!.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(notification),
                              SizedBox(
                                height: 10,
                              ),
                              TextAirbnbCereal(
                                  title: "Pas de Notification !",
                                  size: 20,
                                  color: Color(0xFFF344B67),
                                  fontWeight: FontWeight.w500),
                              SizedBox(
                                height: 10,
                              ),
                              TextAirbnbCereal(
                                  title:
                                      "Vous pouvez consulter l'historique de toute notification",
                                  size: 12,
                                  color: Color(0xFFF344B67),
                                  fontWeight: FontWeight.w400)
                            ],
                          ),
                        );
                      }
                      return ListView.builder(
                          itemCount: tickets?.length,
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OnNotificationView(
                                              id: tickets[index].id,
                                              image: tickets[index].image,
                                            )));
                              },
                              child: NotificationCardWidgetH(
                                image: '${tickets![index].image}',
                                libelle: '${tickets![index].libelle}',
                                montant_regulier:
                                    "${tickets[index].montant_regulier}\$",
                                nbr_participant:
                                    '${tickets[index].nbr_participant}',
                                periode: '',
                                status: '${tickets[index].status}',
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
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
