import 'package:flutter/material.dart';
import '../../../core/widgets/medium_button.dart';
import '../../../core/widgets/text_widget_text2.dart';
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
                          TextWidgetText2(
                            title: "qr_code",
                          ),
                          TextWidgetText2(
                            title: "${snapshot.data!.qr_code.toString()}",
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
                          TextWidgetText2(
                            title: "prix",
                          ),
                          TextWidgetText2(
                            title: "${snapshot.data!.prix}",
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
                          TextWidgetText2(
                            title: "date",
                          ),
                          TextWidgetText2(
                            title: "${snapshot.data!.date}",
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
                          TextWidgetText2(
                            title: "libelle",
                          ),
                          TextWidgetText2(
                            title: "${snapshot.data!.libelle}",
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
                        child: MediumButton(text: "Scan Qr"),
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
