import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:neta_event_mvvm/features/tickets/views_tickets/ticket_card_widget/ticket_card.dart';
import '../../../core/colors.dart';
import '../../../core/size_config.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../tickets_repositories/tickets_api.dart';
import '../view_model_tickets/one_ticket_view_model.dart';
import '../view_model_tickets/tickets_view_model.dart';
import 'one_ticket_view.dart';
import 'ticket_card_widget/get_ticket_widget.dart';

class GetAllTicketView extends StatefulWidget {
  GetAllTicketView({super.key});

  @override
  State<GetAllTicketView> createState() => _GetAllTicketViewState();
}

class _GetAllTicketViewState extends State<GetAllTicketView>
    with TickerProviderStateMixin {
  // var data = TicketsViewModel(ticketsRepository: TicketsApi());

  deletetontines() {
    setState(() {
      //data.DeleteTontineByID(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        shadowColor: Colors.white,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //TicketPage
            TextAirbnbCereal(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              size: 20,
              title: 'Ticket Page',
            ),
            InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AddTontineView()));
                },
                child: Button(
                  fontWeight: FontWeight.normal,
                  text: "ADD EVENT",
                  height: 40,
                  width: 100,
                  fontSize: 15,
                  gradientbackground: gradientbackground,
                  textcolor: Colors.white,
                )),
          ],
        ),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10),
                  ),
                  child: TabBar(
                    indicatorColor: const Color.fromARGB(255, 214, 9, 204),
                    isScrollable: true,
                    controller: _tabController,
                    labelColor: const Color.fromARGB(255, 214, 9, 204),
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Text(
                        "TICKET VALIDES",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text("TICKET EXPIRES"),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Expanded(
                  // color: Color.fromARGB(255, 54, 244, 82),
                  // width: double.maxFinite,
                  // height: getProportionateScreenHeight(500),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      GetAllTicketWidget(),
                      GetAllTicketWidget(),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text("no connection"),
            );
          }
        },
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
