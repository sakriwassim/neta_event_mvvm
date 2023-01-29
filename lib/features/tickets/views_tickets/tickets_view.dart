import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';
import '../../../core/colors.dart';
import '../../../core/size_config.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../../users/evants_repositories/events_api.dart';
import '../../users/view_model_events/events_view_model.dart';
import '../view_model_tickets/tickets_view_model.dart';
import 'ticket_card_widget/ticketswidget.dart';

class GetAllTicketView extends StatefulWidget {
  const GetAllTicketView({super.key});

  @override
  State<GetAllTicketView> createState() => _GetAllTicketViewState();
}

class _GetAllTicketViewState extends State<GetAllTicketView>
    with TickerProviderStateMixin {
  var datauser = UsersViewModel(eventsRepository: UsersApi());

  @override
  void initState() {
    super.initState();

    Provider.of<TicketsViewModel>(context, listen: false).FetchAllTickets();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var providerticket = Provider.of<TicketsViewModel>(context, listen: false);

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

            FutureBuilder(
                future: datauser.GetUserConnected(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    //var body = snapshot.data;
                    var role = snapshot.data!.role_id.toString();
                    return role == "0"
                        ? Container()
                        : InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => AddEventView()));
                            },
                            child: Button(
                              text: "ADD EVENT",
                              height: 40,
                              width: 100,
                              fontSize: 15,
                              gradientbackground: gradientbackground,
                              fontWeight: FontWeight.normal,
                              textcolor: Colors.white,
                            ));
                  }
                }),
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
                      Text(
                        "TICKET EXPIRES",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      TicketsWidget(
                        tickets: providerticket.listAllTickets,
                      ),
                      TicketsWidget(
                        tickets: providerticket.listAllTickets,
                      ),
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
