import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../../core/widgets/small_button_style.dart';
import '../tickets_repositories/tickets_api.dart';
import '../view_model_tickets/one_ticket_view_model.dart';
import '../view_model_tickets/tickets_view_model.dart';
import 'add_ticket_view.dart';
import 'one_ticket_view.dart';

class GetAllTicketView extends StatefulWidget {
  const GetAllTicketView({super.key});

  @override
  State<GetAllTicketView> createState() => _GetAllTicketViewState();
}

class _GetAllTicketViewState extends State<GetAllTicketView>
    with TickerProviderStateMixin {
  var data = TicketsViewModel(ticketsRepository: TicketsApi());

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.title,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddTicketView()));
                },
                child: SmallButton(text: "DELETE ALL")),
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
                Padding(
                  padding: const EdgeInsets.all(15),
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
                  width: double.maxFinite,
                  height: 500,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      RefreshIndicator(
                        onRefresh: () async {
                          setState(() {
                            data.FetchAllTickets();
                          });

                          return Future.delayed(const Duration(seconds: 2));
                        },
                        child: SizedBox(
                          child: Center(
                            child: FutureBuilder<List<OneTicketViewModel>>(
                              future: data.FetchAllTickets(),
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else {
                                  var tickets = snapshot.data;
                                  return ListView.builder(
                                      itemCount: tickets?.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                            onTap: () {
                                              // alertupdate(tickets[index]);

                                   Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OnTicketView(
                                            id: tickets[index].id,
                                          )),
                                     );


                                            },
                                            child: ListTile(
                                              title: Text(
                                                  "${tickets![index].date}",
                                                  style: const TextStyle(
                                                      fontFamily:
                                                          'AirbnbCereal',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 211, 7, 194))),
                                              subtitle: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "${tickets[index].description}",
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'AirbnbCereal',
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                            "${tickets[index].prix}" +
                                                                "€",
                                                            style:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  'AirbnbCereal',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              leading: Image.asset(
                                                "assets/125.png",
                                              ),
                                            ),
                                          ));
                                }
                              }),
                            ),
                          ),
                        ),
                      ),
                      RefreshIndicator(
                        onRefresh: () async {
                          setState(() {
                            data.FetchAllTickets();
                          });

                          return Future.delayed(const Duration(seconds: 2));
                        },
                        child: SizedBox(
                          child: Center(
                            child: FutureBuilder<List<OneTicketViewModel>>(
                              future: data.FetchAllTickets(),
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else {
                                  var tickets = snapshot.data;
                                  return ListView.builder(
                                      itemCount: tickets?.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                            onTap: () {
                                              //  alertupdate(tickets[index]);
                                            },
                                            child: ListTile(
                                              title: Text(
                                                  "${tickets![index].date}",
                                                  style: const TextStyle(
                                                      fontFamily:
                                                          'AirbnbCereal',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 211, 7, 194))),
                                              subtitle: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "${tickets[index].description}",
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'AirbnbCereal',
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                            "${tickets[index].prix}" +
                                                                "€",
                                                            style:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  'AirbnbCereal',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              leading: Image.asset(
                                                "assets/125.png",
                                              ),
                                            ),
                                          ));
                                }
                              }),
                            ),
                          ),
                        ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'There are no bottons to push :)',
            ),
            Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}
