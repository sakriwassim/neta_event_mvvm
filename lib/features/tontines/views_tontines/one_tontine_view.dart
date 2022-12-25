// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:neta_event_mvvm/core/widgets/text_widget_text2.dart';
import 'package:neta_event_mvvm/features/tontines/views_tontines/tontines_view.dart';
import 'package:neta_event_mvvm/features/tontines/views_tontines/update_tontine_view.dart';

import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/size_config.dart';
import '../../../core/string.dart';
import '../../../core/widgets/app_bar_details.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../tontines_repositories/tontines_api.dart';
import '../view_model_tickets/one_tontine_view_model.dart';
import '../view_model_tickets/tontines_view_model.dart';

class OnTontineView extends StatefulWidget {
  final int id;
  final String image;
  OnTontineView({super.key, required this.id, required this.image});

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
            image: '${widget.image}',
            title: 'Tontine details',
          )),
      body: Center(
        child: FutureBuilder<OneTontineViewModel>(
          future: data.GetTontineByID(widget.id),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15),
                      ),
                      child: Row(
                        children: [
                          Text(snapshot.data!.libelle),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            title: "Participants",
                            fontSize: 18.00,
                            fontWeight: FontWeight.normal,
                          ),
                          TextWidget(
                            title:
                                "${snapshot.data!.nbr_participant} participants",
                            fontSize: 18.00,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            title: "Participants",
                            fontSize: 18.00,
                            fontWeight: FontWeight.normal,
                          ),
                          TextWidget(
                            title:
                                "${snapshot.data!.nbr_participant} participants",
                            fontSize: 18.00,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            title: "Participants",
                            fontSize: 18.00,
                            fontWeight: FontWeight.normal,
                          ),
                          TextWidget(
                            title:
                                "${snapshot.data!.nbr_participant} participants",
                            fontSize: 18.00,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextWidget(
                            title: "Monatnt",
                            fontSize: 18.00,
                            fontWeight: FontWeight.normal,
                          ),
                          TextWidget(
                            title: "${snapshot.data!.montant_regulier} \$",
                            fontSize: 18.00,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextWidget(
                            title: "participants actuels",
                            fontSize: 18.00,
                            fontWeight: FontWeight.normal,
                          ),
                          Text("${snapshot.data!.status}"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      title: "Next Owner",
                      fontSize: 18.00,
                      fontWeight: FontWeight.normal,
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          title: "participants actuels",
                          fontSize: 18.00,
                          fontWeight: FontWeight.normal,
                        ),
                        Text("${snapshot.data!.status}"),
                      ],
                    ),
                    Text("${snapshot.data!.status}"),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15),
                      ),
                      child: Row(
                        children: [
                          Text(snapshot.data!.libelle),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(snapshot.data!.libelle),
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
    );
  }
}
