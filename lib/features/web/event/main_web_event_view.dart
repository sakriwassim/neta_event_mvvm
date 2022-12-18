import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:neta_event_mvvm/features/web/event/events_body_view_mobile.dart';

import '../../../core/responsive.dart';
import '../../events/views_events/events_body_view.dart';
import 'events_body_view_tab_web.dart';
import 'widget/header.dart';

class MainWebEventView extends StatefulWidget {
  const MainWebEventView({super.key});

  @override
  State<MainWebEventView> createState() => _MainWebEventViewState();
}

class _MainWebEventViewState extends State<MainWebEventView> {
  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Header(),
            Expanded(
              child: GetAllEventViewBodyTabWeb(),
            ),
          ],
        ),
      );
    }
    if (Responsive.isTablet(context)) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Header(),
            Expanded(
              child: GetAllEventViewBodyTabWeb(),
            ),
          ],
        ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Header(),
          Expanded(
            child: GetAllEventViewBodyMobile(),
          ),
        ],
      ),
    );
  }
}
