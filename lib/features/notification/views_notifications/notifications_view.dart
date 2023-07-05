import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neta_event_mvvm/core/widgets/text_widget_text1.dart';
import '../../../core/colors.dart';
import '../../../core/string.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../tontines/models_tontines/tontine_model.dart';
import '../../tontines/view_model_tickets/tontines_view_model.dart';
import 'one_notification_view.dart';
import 'widget/notification_card_widget.dart';
import 'widget/notifications_widget.dart';

class GetAllNotificationView extends StatefulWidget {
  const GetAllNotificationView ({Key? key}) : super(key: key);

  @override
  State<GetAllNotificationView> createState() => _GetAllNotificationViewState();
}

class _GetAllNotificationViewState extends State<GetAllNotificationView> {
  @override
  Widget build(BuildContext context) {
    var notifications = [];
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
              "notifications",
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
            return Center(
              child: notifications.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(notification),
                          const SizedBox(
                            height: 10,
                          ),
                          TextAirbnbCereal(
                              title: "Pas de Notification !",
                              size: 20,
                              color: const Color(0xFFF344B67),
                              fontWeight: FontWeight.w500),
                          const SizedBox(
                            height: 10,
                          ),
                          TextAirbnbCereal(
                              title:
                                  "Vous pouvez consulter l'historique de toute notification",
                              size: 12,
                              color: const Color(0xfff344b67),
                              fontWeight: FontWeight.w400)
                        ],
                      ),
                    )
                  : Notifications(notifications: notifications),
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
