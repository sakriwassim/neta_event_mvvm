import 'package:flutter/material.dart';
import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/widgets/app_bar_details.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../tickets_repositories/tickets_api.dart';
import '../view_model_tickets/one_ticket_view_model.dart';
import '../view_model_tickets/tickets_view_model.dart';

class OnTicketView extends StatefulWidget {
  int id;
  OnTicketView({super.key, required this.id});

  @override
  State<OnTicketView> createState() => _OnTicketViewState();
}

class _OnTicketViewState extends State<OnTicketView> {
  var data = TicketsViewModel(ticketsRepository: TicketsApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: AppBar(
            elevation: 0.0,
            shadowColor: Colors.white,
            title: const Text(
              "Tickts",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            flexibleSpace: const Center(
              child: Image(
                //assets/ticket/imageticket.png
                image: AssetImage('assets/ticket/imageticket.png'),
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.transparent,
          )),
      body: Center(
        child: FutureBuilder<OneTicketViewModel>(
          future: data.GetTicketByID(widget.id),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextAirbnbCereal(
                            title: "qr_code",
                            fontWeight: FontWeight.w400,
                            color: null,
                            size: 18,
                          ),
                          TextAirbnbCereal(
                            title: "${snapshot.data!.qr_code.toString()}",
                            fontWeight: FontWeight.w400,
                            color: null,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextAirbnbCereal(
                            title: "prix",
                            fontWeight: FontWeight.w400,
                            color: null,
                            size: 18,
                          ),
                          TextAirbnbCereal(
                            title: "${snapshot.data!.prix}",
                            fontWeight: FontWeight.w400,
                            color: null,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextAirbnbCereal(
                            title: "date",
                            fontWeight: FontWeight.normal,
                            color: null,
                            size: 18,
                          ),
                          TextAirbnbCereal(
                            title: "${snapshot.data!.date}",
                            fontWeight: FontWeight.normal,
                            color: null,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextAirbnbCereal(
                            title: "libelle",
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            size: 18,
                          ),
                          TextAirbnbCereal(
                            title: "${snapshot.data!.libelle}",
                            fontWeight: FontWeight.normal,
                            size: 18,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Button(
                          text: "Scan Qr",
                          fontSize: fontSizemediumbutton,
                          gradientbackground: gradientbackground,
                          height: heightmediumbutton,
                          width: widthmediumbutton,
                          fontWeight: FontWeight.normal,
                          textcolor: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          }),
        ),
      ),
    );
  }
}
