import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/widgets/rectangle_image.dart';
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
   // SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Tickts",
          style: TextStyle(
            color: Color.fromARGB(255, 208, 10, 10),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 228, 9, 9),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        //backgroundColor: Colors.transparent,
        child: Center(
          child: FutureBuilder<OneTicketViewModel>(
            future: data.GetTicketByID(widget.id),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.blue,
                      child: RectangleImage(
                        height: 150,
                        //image: '${snapshot.data!.qr_code}',
                        image: "https://picsum.photos/250?image=9",
                        width: 150,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
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
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            }),
          ),
        ),
      ),
    );
  }
}
