import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:neta_event_mvvm/features/web/web_add_user_view.dart';

import '../users/views_events/events_view.dart';

class WebUserView extends StatefulWidget {
  const WebUserView({super.key});

  @override
  State<WebUserView> createState() => _WebUserViewState();
}

class _WebUserViewState extends State<WebUserView> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        children: [
          Container(height: screenHeight * 0.5, child: AddUserViewWeb()),
          Container(height: screenHeight * 0.4, child: GetAllUserView()),
        ],
      ),
    );
  }
}
