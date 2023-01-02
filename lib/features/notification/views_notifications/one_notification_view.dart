// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:http/http.dart' as http;

import 'package:neta_event_mvvm/features/tontines/views_tontines/update_tontine_view.dart';

import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/size_config.dart';
import '../../../core/widgets/app_bar_details.dart';
import '../../../core/widgets/image_cached_internet.dart';
import '../../../core/Screen/payment_screen.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../../tontines/tontines_repositories/tontines_api.dart';
import '../../tontines/view_model_tickets/tontines_view_model.dart';
import '../../users/evants_repositories/events_api.dart';
import '../../users/view_model_events/events_view_model.dart';

class OnNotificationView extends StatefulWidget {
  final int id;
  final String image;
  OnNotificationView({
    Key? key,
    required this.id,
    required this.image,
  }) : super(key: key);

  @override
  State<OnNotificationView> createState() => _OnNotificationViewState();
}

class _OnNotificationViewState extends State<OnNotificationView> {
  //user_id
  var dataTontines = TontinesViewModel(ticketsRepository: TontinesApi());
  var dataUser = UsersViewModel(eventsRepository: UsersApi());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: AppBarDetails(
            image: widget.image,
            title: 'Tontine details',
          )),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return RefreshIndicator(
              onRefresh: () async {
                setState(() {});

                return Future.delayed(const Duration(seconds: 2));
              },
              child: Center(
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: Future.wait([
                      dataTontines.GetTontineByID(widget.id),
                      dataUser.GetUserByID(widget.id)
                    ]),
                    builder: ((context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(25),
                                ),
                                child: Row(
                                  children: [
                                    TextAirbnbCereal(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      size: 18,
                                      title: snapshot.data![0].libelle,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(25),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextAirbnbCereal(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        size: 10,
                                        title:
                                            "Chaque ${snapshot.data![0].periode}"),
                                    TextAirbnbCereal(
                                        color: const Color(0xFFFE28541),
                                        fontWeight: FontWeight.w500,
                                        size: 10,
                                        title:
                                            "Chaque ${snapshot.data![0].libelle}"),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(25),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextAirbnbCereal(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      size: 18,
                                      title: "Participants",
                                    ),
                                    TextAirbnbCereal(
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w500,
                                        size: 10,
                                        title:
                                            "${snapshot.data![0].nbr_participant} participants"),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(25),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextAirbnbCereal(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      size: 18,
                                      title: "Montants",
                                    ),
                                    TextAirbnbCereal(
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w500,
                                        size: 10,
                                        title:
                                            "${snapshot.data![0].montant_regulier} fcfa"),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextAirbnbCereal(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                size: 18,
                                title: "Next Owner",
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                child: CircleAvatar(
                                  child: ClipOval(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: ImageCachedInternet(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        imageUrl: '${snapshot.data![1].image}',
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextAirbnbCereal(
                                color: const Color(0xFF777777),
                                fontWeight: FontWeight.w400,
                                size: 16,
                                title: "${snapshot.data![1].nom_complet}",
                              ),
                              TextAirbnbCereal(
                                color: const Color(0xFF777777),
                                fontWeight: FontWeight.w400,
                                size: 16,
                                title: "Next Owner",
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(25),
                                ),
                                child: Row(
                                  children: [
                                    TextAirbnbCereal(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      size: 25,
                                      title: "Participants",
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextAirbnbCereal(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    size: 20,
                                    title: "Payer ${snapshot.data![0].libelle}",
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PaymentScreen()));
                                      },
                                      child: Button(
                                        fontWeight: FontWeight.w500,
                                        text: "PAYER",
                                        fontSize: 20,
                                        gradientbackground: gradientbackground,
                                        height: heightmediumbutton,
                                        width: widthmediumbutton,
                                        textcolor: Colors.white,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
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
