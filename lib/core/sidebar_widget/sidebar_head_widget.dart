import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/widgets/circle_image.dart';
import '../../features/users/evants_repositories/events_api.dart';
import '../../features/users/view_model_events/events_view_model.dart';
import '../size_config.dart';
import '../widgets/text_widget_text1.dart';

class SideHeader extends StatefulWidget {
  SideHeader({super.key});

  //var data = UsersViewModel(eventsRepository: UsersApi());

  @override
  State<SideHeader> createState() => _SideHeaderState();
}

class _SideHeaderState extends State<SideHeader> {
  var data = UsersViewModel(eventsRepository: UsersApi());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        height: getProportionateScreenHeight(150),
        child: Container(
          alignment: Alignment.centerLeft,
          child: FutureBuilder(
            future: data.GetUserConnected(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleImage(
                      image: '${snapshot.data!.image}',
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(60),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextAirbnbCereal(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            size: 19,
                            title: "${snapshot.data!.nom_complet}",
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, .3),
                          child: TextAirbnbCereal(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            size: 14,
                            title: 'Client',
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: const CircularProgressIndicator());
            }),
          ),
        ));
  }
}
