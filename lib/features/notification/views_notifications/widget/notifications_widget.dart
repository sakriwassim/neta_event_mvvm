import 'package:flutter/material.dart';

import '../one_notification_view.dart';
import 'notification_card_widget.dart';

class Notifications extends StatelessWidget {
  const Notifications({
    Key? key,
    required this.notifications,
  }) : super(key: key);

  final List notifications;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OnNotificationView(
                            id: notifications[index].id,
                            image: notifications[index].image,
                          )));
            },
            child: NotificationCardWidgetH(
              image: '${notifications[index].image}',
              libelle: '${notifications[index].libelle}',
              montant_regulier: "${notifications[index].montant_regulier}\$",
              nbr_participant: '${notifications[index].nbr_participant}',
              periode: '',
              status: '${notifications[index].status}',
              id: notifications[index].id,
            )));
  }
}
