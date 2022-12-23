import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/features/authentification/models_authentification/response_model.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/one_event_view_model.dart';
import 'package:neta_event_mvvm/features/events/views_events/events_view.dart';
import 'package:neta_event_mvvm/features/events/views_events/update_event_view.dart';

import '../../../core/colors.dart';
import '../../../core/size_config.dart';
import '../../../core/string.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../evants_repositories/events_api.dart';
import '../view_model_events/events_view_model.dart';

class OnEventView extends StatefulWidget {
  final int id;
  OnEventView({super.key, required this.id});

  @override
  State<OnEventView> createState() => _OnEventViewState();
}

class _OnEventViewState extends State<OnEventView> {
  var data = EventsViewModel(eventsRepository: EventsApi());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(getProportionateScreenHeight(150)),
          child: AppBar(
            elevation: 0.0,
            shadowColor: Colors.white,
            title: TextAirbnbCereal(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              size: 24,
              title: 'Event details',
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            flexibleSpace: Container(
              child: Image(
                image: AssetImage('assets/130.png'),
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.transparent,
          )),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<OneEventViewModel>(
            future: data.GetEventByID(widget.id),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Container(
                      height: getProportionateScreenHeight(100),
                      child: TextAirbnbCereal(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        size: 35,
                        title: snapshot.data!.libelle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(132, 210, 40, 105),
                                  // border: Border.all(
                                  //   color: Color.fromRGBO(210, 40, 106, 1),
                                  // ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              height: 50,
                              width: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(Calendar),
                              )),
                          TextAirbnbCereal(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            size: 16,
                            title: '${snapshot.data!.date_heure}',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(132, 210, 40, 105),
                                  // border: Border.all(
                                  //   color: Color.fromRGBO(210, 40, 106, 1),
                                  // ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              height: 50,
                              width: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(Location),
                              )),
                          TextAirbnbCereal(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            size: 16,
                            title: '${snapshot.data!.adresse}',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("participants actuels"),
                          Text("${snapshot.data!.status}"),
                        ],
                      ),
                    ),
                    const Text("Next Owner"),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image.network(
                            'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateEventView(
                                        eventObj: snapshot.data!,
                                      )));
                        },
                        child: Button(
                          text: "PASSER LA COMMANDE",
                          fontSize: 20,
                          gradientbackground: gradientbackground,
                          height: heightbigbutton,
                          width: widthbigbutton,
                          fontWeight: FontWeight.normal,
                        ))
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
