import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/tickets/views_tickets/ticket_card_widget/ticket_card.dart';
import 'package:provider/provider.dart';
import '../../../../core/colors.dart';
import '../../../../core/int.dart';
import '../../../../core/size_config.dart';
import '../../../../core/widgets/rectangle_image.dart';
import '../../../../core/widgets/small_button_style.dart';
import '../../../events/view_model_events/events_view_model.dart';
import '../../models_tickets/ticket_model.dart';
import '../../view_model_tickets/tickets_view_model.dart';

class GetAllTicketWidget extends StatefulWidget {
  const GetAllTicketWidget({super.key});

  @override
  State<GetAllTicketWidget> createState() => _GetAllTicketWidgetState();
}

class _GetAllTicketWidgetState extends State<GetAllTicketWidget> {
  var tickets = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<TicketsViewModel>(context, listen: false).FetchAllTickets();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tickets =
        Provider.of<TicketsViewModel>(context, listen: true).listAllTickets!;

    SizeConfig().init(context);
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: tickets != []
                ? ListView.builder(
                    itemCount: tickets.length,
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: MaterialLocalizations.of(context)
                                .modalBarrierDismissLabel,
                            barrierColor: Colors.black54,
                            pageBuilder: (context, anim1, anim2) {
                              return Center(
                                child: SizedBox(
                                  //color: Colors.blue,
                                  width: getProportionateScreenWidth(200),
                                  height: getProportionateScreenHeight(250),
                                  child: StatefulBuilder(
                                    builder: (context, snapshot) {
                                      return Card(
                                        elevation: 0,
                                        color: Colors.transparent,
                                        //color: Color.fromARGB(255, 228, 9, 9),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              RectangleImage(
                                                height:
                                                    getProportionateScreenHeight(
                                                        150),
                                                image:
                                                    "https://admin.saitech-group.com/api_event/public/Images/1672243424.png",
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        20),
                                              ),
                                              InkWell(
                                                onTap: () async {},
                                                child: Button(
                                                  text: "Scan Qr",
                                                  fontSize:
                                                      fontSizemediumbutton,
                                                  gradientbackground:
                                                      gradientbackground,
                                                  height: heightmediumbutton,
                                                  width:
                                                      getProportionateScreenWidth(
                                                          80),
                                                  fontWeight: FontWeight.normal,
                                                  textcolor: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: TicketCardWidget(
                          ticketModel: tickets[index],
                        )))
                : CircularProgressIndicator()));
  }
}
