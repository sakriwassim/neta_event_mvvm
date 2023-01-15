import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/tickets/views_tickets/ticket_card_widget/ticket_card.dart';

import '../../../../core/colors.dart';
import '../../../../core/int.dart';
import '../../../../core/size_config.dart';
import '../../../../core/widgets/rectangle_image.dart';
import '../../../../core/widgets/small_button_style.dart';
import '../../../events/evants_repositories/events_api.dart';
import '../../../events/view_model_events/events_view_model.dart';
import '../../tickets_repositories/tickets_api.dart';
import '../../view_model_tickets/tickets_view_model.dart';

class GetAllTicketWidget extends StatefulWidget {
  const GetAllTicketWidget({super.key});

  @override
  State<GetAllTicketWidget> createState() => _GetAllTicketWidgetState();
}

class _GetAllTicketWidgetState extends State<GetAllTicketWidget> {
  var data = TicketsViewModel(ticketsRepository: TicketsApi());
  var dataEvents = EventsViewModel(eventsRepository: EventsApi());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.maxFinite,
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            data.GetTicketsUserConnected();
          });

          return Future.delayed(const Duration(seconds: 2));
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: FutureBuilder(
              future: data.GetTicketsByUser(1),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  var tickets = snapshot.data;
                  return ListView.builder(
                      itemCount: tickets?.length,
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
                                                  // image:
                                                  //     '${tickets[index].qr_code}',
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
                                                    fontWeight:
                                                        FontWeight.normal,
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

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => OnTicketView(
                            //               id: tickets![index].id,
                            //               // image: tickets[index].image,
                            //             )));
                          },
                          child: TicketCardWidget(
                            event_id: '${tickets![index].event_id}',
                            QR_code: '${tickets[index].qr_code}',
                            date_expire: '${tickets[index].date}',
                            libelle: '${tickets[index].libelle}',
                            prix: '${tickets[index].prix}',
                            statut: '${tickets[index].statut}',
                          )));
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}
