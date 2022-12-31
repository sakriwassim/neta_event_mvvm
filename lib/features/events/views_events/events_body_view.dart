import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/features/events/views_events/widgets/event_card_widget_home.dart';

import '../../../core/size_config.dart';
import '../../../core/string.dart';
import '../../../search.dart';
import '../evants_repositories/events_api.dart';
import '../view_model_events/events_view_model.dart';
import '../view_model_events/one_event_view_model.dart';
import 'one_event_view.dart';
import 'widgets/event_card_widget.dart';

class GetAllEventViewBody extends StatefulWidget {
  const GetAllEventViewBody({super.key});

  @override
  State<GetAllEventViewBody> createState() => _GetAllEventViewBodyState();
}

class _GetAllEventViewBodyState extends State<GetAllEventViewBody> {
  var data = EventsViewModel(eventsRepository: EventsApi());

  final searchcontroler = TextEditingController();


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        //debugShowCheckedModeBanner: false,
        body: Column(
      children: [
        Container(
          color: Colors.white,
          height: getProportionateScreenHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  height: getProportionateScreenHeight(30),
                  width: getProportionateScreenWidth(30),
                  child: InkWell(
                    onTap: () {
                      showSearch(context: context, delegate: SearchElement());
                    },
                    child: SvgPicture.asset(searchcolor),
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                SvgPicture.asset(Lineevent),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Container(
                  width: getProportionateScreenWidth(180),
                  child: TextField(
                    controller: searchcontroler,
                  
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Chercher',
                      hintStyle: TextStyle(
                        fontFamily: 'AirbnbCereal',
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if (connected) {
                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      data.FetchAllEvents("${searchcontroler.text.trim()}");
                    });

                    return Future.delayed(const Duration(seconds: 2));
                  },
                  child: Center(
                    child: FutureBuilder<List<OneEventViewModel>>(
                      future:
                          data.FetchAllEvents("${searchcontroler.text.trim()}"),
                      builder: ((context, snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        } else {
                          var events = snapshot.data;
                          return ListView.builder(
                              itemCount: events?.length,
                              itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OneEventView(
                                                id: events[index].id,
                                                image: events[index].image,
                                              )),
                                    );
                                  },
                                  child: EventCardWidget(
                                    description: events![index].description,
                                    events: events,
                                    date_heure: events[index].date_heure,
                                    libelle: events[index].libelle,
                                    adresse: events[index].adresse,
                                    prix: events[index].prix,
                                    image: events[index].image,
                                  )));
                        }
                      }),
                    ),
                  ),
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
        ),
      ],
    ));
  }
}
