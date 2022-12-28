// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/int.dart';
import '../../../../core/size_config.dart';
import '../../../../core/widgets/circle_image.dart';
import '../../../../core/widgets/image_cached_internet.dart';
import '../../../../core/widgets/rectangle_image.dart';
import '../../../../core/widgets/small_button_style.dart';
import '../../../../core/widgets/text_widget_text1.dart';
import '../../../events/evants_repositories/events_api.dart';
import '../../../events/view_model_events/events_view_model.dart';
import '../../view_model_tickets/one_ticket_view_model.dart';

class TicketCardWidget extends StatelessWidget {
  //event_id
  String? event_id;
  String? libelle;
  String? prix;
  String? QR_code;
  String? date;
  String? date_expire;
  String? statut;
  int? id;

  TicketCardWidget({
    Key? key,
    this.libelle,
    this.event_id,
    this.prix,
    this.QR_code,
    this.date,
    this.date_expire,
    this.statut,
    this.events,
  }) : super(key: key);

  final List<OneTicketViewModel>? events;

  @override
  Widget build(BuildContext context) {
    var data = EventsViewModel(eventsRepository: EventsApi());

    SizeConfig().init(context);
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
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),

        height: getProportionateScreenHeight(150), //120,
        child: FutureBuilder(
          future: data.GetEventByID(int.parse('$event_id')),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleImage(
                      height: 100,
                      image: '${snapshot.data!.image}',
                      width: 100,
                    ),
                    // Spacer(),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextAirbnbCereal(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w400,
                                size: 25,
                                title: "${snapshot.data!.libelle}"),
                            TextAirbnbCereal(
                                color: Color.fromARGB(255, 11, 205, 235),
                                fontWeight: FontWeight.w500,
                                size: 12,
                                title: "${snapshot.data!.date_heure}"),
                          ],
                        ),
                      ),
                    ),
                    //Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: getProportionateScreenHeight(60),
                          // height: double.infinity,
                          //color: Colors.blue,
                          child: RectangleImage(
                            height: 60,
                            width: 20,
                            image: "$QR_code",
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        TextAirbnbCereal(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w500,
                            size: 12,
                            title: "${snapshot.data!.prix} fcfa"),
                      ],
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: const CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}




/**
 

 FutureBuilder(
              future: data.FetchAllTickets(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  var tickets = snapshot.data;
                  return ListView.builder(
                      itemCount: tickets?.length,
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OnTicketView(
                                          id: tickets![index].id,
                                          // image: tickets[index].image,
                                        )));
                          },
                          child: TicketCardWidget(
                            QR_code: '${tickets![index].qr_code}',
                            date_expire: '${tickets![index].date}',
                            libelle: '${tickets![index].libelle}',
                            prix: '${tickets![index].prix}',
                            statut: '${tickets![index].statut}',
                          )));
                }
              }),
            ),


 */