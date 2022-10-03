import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/view_model/one_event_view_model.dart';

class UpdateEventView extends StatefulWidget {
  final OneEventViewModel eventObj;
  UpdateEventView({super.key, required this.eventObj});

  @override
  State<UpdateEventView> createState() => _UpdateEventViewState();
}

class _UpdateEventViewState extends State<UpdateEventView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          print(widget.eventObj);
        },
        child: Text("null"),
      ),
    );
  }
}
