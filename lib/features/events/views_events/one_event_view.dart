import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/one_event_view_model.dart';
import 'package:neta_event_mvvm/features/events/views_events/update_event_view.dart';

import '../../../core/colors.dart';
import '../../../core/size_config.dart';
import '../../../core/string.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../evants_repositories/events_api.dart';
import '../view_model_events/events_view_model.dart';

class OneEventView extends StatefulWidget {
  final int id;
  OneEventView({super.key, required this.id});

  @override
  State<OneEventView> createState() => _OneEventViewState();
}

class _OneEventViewState extends State<OneEventView> {
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
            flexibleSpace: const Image(
              image: AssetImage('assets/130.png'),
              fit: BoxFit.cover,
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
                    SizedBox(
                      height: getProportionateScreenHeight(100),
                      child: TextAirbnbCereal(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        size: 35,
                        title: snapshot.data!.libelle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(Datecala),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          SizedBox(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: getProportionateScreenWidth(5),
                                  ),
                                  TextAirbnbCereal(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    size: 16,
                                    title: '${snapshot.data!.date_heure}',
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(locationcolor),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          SizedBox(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: getProportionateScreenWidth(5),
                                  ),
                                  TextAirbnbCereal(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    size: 16,
                                    title: '${snapshot.data!.adresse}',
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              color: Colors.redAccent,
                            ),
                            height: 50,
                            width: 50,
                            child: FadeInImage.assetNetwork(
                              height: 60,
                              width: 60,
                              placeholder: 'assets/lod.gif',
                              image: '${snapshot.data!.image}',
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          SizedBox(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: getProportionateScreenWidth(5),
                                  ),
                                  Column(
                                    children: [
                                      TextAirbnbCereal(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        size: 16,
                                        title: '${snapshot.data!.libelle}',
                                      ),
                                      TextAirbnbCereal(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        size: 16,
                                        title: '${snapshot.data!.status}',
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("participants actuels"),
                          Text("${snapshot.data!.status}"),
                        ],
                      ),
                    ),
                    const Text("Next Owner"),
                    SizedBox(
                      width: getProportionateScreenWidth(100),
                      height: getProportionateScreenHeight(100),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/lod.gif',
                            image:
                                'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                          ),

                          //  Image.network(
                          //   'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                          //   fit: BoxFit.cover,
                          //   width: getProportionateScreenWidth(100),
                          //   height: getProportionateScreenHeight(100),
                          // ),
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
                          fontWeight: FontWeight.normal, textcolor:  Colors.white,
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
