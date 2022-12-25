// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:neta_event_mvvm/features/tontines/views_tontines/update_tontine_view.dart';
import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/size_config.dart';
import '../../../core/widgets/app_bar_details.dart';
import '../../../core/widgets/image_cached_internet.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../tontines_repositories/tontines_api.dart';
import '../view_model_tickets/one_tontine_view_model.dart';
import '../view_model_tickets/tontines_view_model.dart';

class OnTontineView extends StatefulWidget {
  final int id;
  final String image;
  const OnTontineView({super.key, required this.id, required this.image});

  @override
  State<OnTontineView> createState() => _OnTontineViewState();
}

class _OnTontineViewState extends State<OnTontineView> {
  var data = TontinesViewModel(ticketsRepository: TontinesApi());

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
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<OneTontineViewModel>(
            future: data.GetTontineByID(widget.id),
            builder: ((context, snapshot) {
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
                              title: snapshot.data!.libelle,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextAirbnbCereal(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                size: 10,
                                title: "Chaque ${snapshot.data!.periode}"),
                            TextAirbnbCereal(
                                color: const Color(0xFFFE28541),
                                fontWeight: FontWeight.w500,
                                size: 10,
                                title: "Chaque ${snapshot.data!.libelle}"),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextAirbnbCereal(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              size: 18,
                              title: "Participants",
                            ),
                            TextAirbnbCereal(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w500,
                                size: 10,
                                title:
                                    "${snapshot.data!.nbr_participant} participants"),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextAirbnbCereal(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              size: 18,
                              title: "Montants",
                            ),
                            TextAirbnbCereal(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w500,
                                size: 10,
                                title:
                                    "${snapshot.data!.montant_regulier} fcfa"),
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
                                height: MediaQuery.of(context).size.height,
                                imageUrl: '${snapshot.data!.image}',
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextAirbnbCereal(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            size: 20,
                            title: snapshot.data!.libelle,
                          ),
                          TextAirbnbCereal(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            size: 20,
                            title: snapshot.data!.libelle,
                          ),
                        ],
                      ),
                      TextAirbnbCereal(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        size: 20,
                        title: snapshot.data!.libelle,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15),
                        ),
                        child: Row(
                          children: [
                            TextAirbnbCereal(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              size: 20,
                              title: snapshot.data!.libelle,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextAirbnbCereal(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            size: 20,
                            title: snapshot.data!.libelle,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdateTontineView(
                                              ticketObj: snapshot.data!,
                                            )));
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
  }
}
