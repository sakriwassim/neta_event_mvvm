// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/colors.dart';
import '../../../../core/size_config.dart';
import '../../../../core/widgets/circle_image.dart';
import '../../../../core/widgets/rectangle_image.dart';
import '../../../../core/widgets/text_widget_text1.dart';
import '../../../events/view_model_events/events_view_model.dart';
import '../../models_tickets/ticket_model.dart';
import '../../models_tickets/ticket_model.dart';

class TicketCardWidget extends StatefulWidget {
  TicketModel? ticketModel;

  TicketCardWidget({super.key, required this.ticketModel});

  @override
  State<TicketCardWidget> createState() => _TicketCardWidgetState();
}

class _TicketCardWidgetState extends State<TicketCardWidget> {
  String eventimage = '';
  String dateevent = '';
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<EventsViewModel>(context, listen: false)
          .GetEventByID(int.parse(widget.ticketModel!.event_id!));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    eventimage =
        Provider.of<EventsViewModel>(context, listen: false).eventsbyID!.image!;
    dateevent = Provider.of<EventsViewModel>(context, listen: false)
        .eventsbyID!
        .dateHeure!;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(5),
          vertical: getProportionateScreenWidth(5)),
      child: Container(
        decoration: BoxDecoration(
          gradient: gradientbackgroundticket,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),

        height: getProportionateScreenHeight(150), //120,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleImage(
                height: 100,
                image: eventimage,
                width: 100,
              ),

              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextAirbnbCereal(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w400,
                          size: 25,
                          title: "${widget.ticketModel!.libelle}" ?? ""),
                      TextAirbnbCereal(
                          color: const Color.fromARGB(255, 11, 205, 235),
                          fontWeight: FontWeight.w500,
                          size: 12,
                          title: dateevent),
                    ],
                  ),
                ),
              ),
              //Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(60),
                    // height: double.infinity,
                    //color: Colors.blue,
                    child: RectangleImage(
                      height: 60,
                      width: 20,
                      image: "${widget.ticketModel!.Qr_code}",
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  TextAirbnbCereal(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                      size: 12,
                      title: "${widget.ticketModel!.prix} fcfa"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
