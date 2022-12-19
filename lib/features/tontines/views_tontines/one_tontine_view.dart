import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/widgets/text_widget_text2.dart';
import 'package:neta_event_mvvm/features/tontines/views_tontines/tontines_view.dart';
import 'package:neta_event_mvvm/features/tontines/views_tontines/update_tontine_view.dart';

import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/widgets/small_button_style.dart';
import '../tontines_repositories/tontines_api.dart';
import '../view_model_tickets/one_tontine_view_model.dart';
import '../view_model_tickets/tontines_view_model.dart';

class OnTontineView extends StatefulWidget {
  final int id;
  OnTontineView({super.key, required this.id});

  @override
  State<OnTontineView> createState() => _OnTontineViewState();
}

class _OnTontineViewState extends State<OnTontineView> {
  var data = TontinesViewModel(ticketsRepository: TontinesApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: AppBar(
            elevation: 0.0,
            shadowColor: Colors.white,
            title: Text(
              "Tontine details",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            flexibleSpace: const Center(
              child: Image(
                image: AssetImage('assets/130.png'),
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.transparent,
          )),
      body: Center(
        child: FutureBuilder<OneTontineViewModel>(
          future: data.GetTontineByID(widget.id),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  // Image.asset("assets/130.png"),
                  Text(snapshot.data!.libelle),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                                fontWeight: FontWeight.normal,
                            text: "MODIFIER",
                            fontSize: 20,
                            gradientbackground: gradientbackground,
                            height: heightbigbutton,
                            width: widthbigbutton,
                          )),
                      InkWell(
                          onTap: () async {
                            var delete =
                                await data.DeleteTontineByID(snapshot.data!.id);

                            if (delete == true) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GetAllTontineView()));
                            }
                          },
                          child: Button(
                                fontWeight: FontWeight.normal,
                            text: "SUPPRIMER",
                            fontSize: fontSizeminibutton,
                            gradientbackground: gradientbackground,
                            height: heightminibutton,
                            width: widthminibutton,
                          )),
                    ],
                  )
                ],
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
