import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:provider/provider.dart';
import '../../../core/colors.dart';
import '../../../core/size_config.dart';
import '../../../core/string.dart';
import '../../../core/widgets/app_bar_details.dart';
import '../../../core/widgets/gradient_text_widget.dart';
import '../../../core/widgets/image_cached_internet.dart';
import '../../../core/Screen/payment_screen.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../../users/view_model_events/users_view_model.dart';
import '../models_events/event_model.dart';
import '../view_model_events/events_view_model.dart';
import 'add_event_view.dart';

class OneEventView extends StatefulWidget {
  EventModel? eventModel;

  OneEventView({super.key, required this.eventModel});

  @override
  State<OneEventView> createState() => _OneEventViewState();
}

class _OneEventViewState extends State<OneEventView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<UsersViewModel>(context, listen: false).GetUserConnected();
    });
  }

  @override
  Widget build(BuildContext context) {
    var userconnected =
        Provider.of<UsersViewModel>(context, listen: false).userConnected;
    var provider = Provider.of<EventsViewModel>(context, listen: true);

    modifierevent() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddEventView(
                    isupdate: true,
                    eventModel: widget.eventModel,
                  )));

      provider.UpdateEventByID(widget.eventModel!);
    }

    supprimeevent() {
      provider.DeleteEventByID(widget.eventModel!.id!);
      if (provider.back) {
        print("event deleted");
        Navigator.pop(context);
      }
    }

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getProportionateScreenHeight(150)),
        child: PreferredSize(
            preferredSize: const Size.fromHeight(150.0),
            child: AppBarDetails(
              image: widget.eventModel?.image!,
              title: "Event détaille",
            )),
      ),
      body: SingleChildScrollView(
        child: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(60),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        height: getProportionateScreenHeight(60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GradientTextWidget(
                              fontWeight: FontWeight.w500,
                              size: 12, text: widget.eventModel!.libelle!,
                              // text: snapshot.data!.libelle,
                            ),
                            Button(
                                gradientbackground: gradientbackground,
                                text: "Favoris",
                                textcolor: Colors.white,
                                height: heightminibutton,
                                width: widthminibutton,
                                fontSize: 12,
                                fontWeight: FontWeight.w400)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(100),
                      child: TextAirbnbCereal(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        size: 35,
                        title: widget.eventModel!.libelle!,
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
                                    title: widget.eventModel!.dateHeure!,
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
                                    title: widget.eventModel!.adresse!,
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
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              color: Colors.redAccent,
                            ),
                            height: getProportionateScreenHeight(50),
                            width: getProportionateScreenWidth(50),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: ImageCachedInternet(
                                height: getProportionateScreenHeight(50),
                                imageUrl: widget.eventModel!.image!,
                                width: getProportionateScreenWidth(50),
                              ),
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
                                        title: widget.eventModel!.libelle!,
                                      ),
                                      TextAirbnbCereal(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        size: 16,
                                        title: widget.eventModel!.statut!,
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                          const Spacer(),
                          Container(
                              height: getProportionateScreenHeight(
                                  heightmediumbutton),
                              width: getProportionateScreenWidth(
                                  widthmediumbutton),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(31, 255, 83, 249),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Center(
                                child: GradientTextWidget(
                                  fontWeight: FontWeight.w400,
                                  size: fontSizemediumbutton,
                                  text: 'Découvrir',
                                ),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(50),
                          ),
                          child: TextAirbnbCereal(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                            size: 25,
                            title: 'A propos',
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(50),
                          ),
                          child: TextAirbnbCereal(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w400,
                            size: 25,
                            title: widget.eventModel!.description!,
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    userconnected?.roleId == "3"
                        ? Container()
                        : userconnected?.roleId == "0"
                            ? InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PaymentScreen(
                                                addTontineModel: null,
                                              )));
                                },
                                child: Button(
                                  text: "PASSER LA COMMANDE",
                                  fontSize: 20,
                                  gradientbackground: gradientbackground,
                                  height: heightbigbutton,
                                  width: widthbigbutton,
                                  fontWeight: FontWeight.normal,
                                  textcolor: Colors.white,
                                ),
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5, left: 10),
                                      child: InkWell(
                                        onTap: supprimeevent,
                                        child: Button(
                                          text: "SUPPRIMER",
                                          fontSize: 20,
                                          gradientbackground:
                                              gradientbackground,
                                          height: heightmediumbutton,
                                          width: widthmediumbutton,
                                          fontWeight: FontWeight.normal,
                                          textcolor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, left: 5),
                                      child: InkWell(
                                        onTap: modifierevent,
                                        child: Button(
                                          text: "MODIFIER",
                                          fontSize: 20,
                                          gradientbackground:
                                              gradientbackground,
                                          height: heightmediumbutton,
                                          width: widthmediumbutton,
                                          fontWeight: FontWeight.normal,
                                          textcolor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                  ],
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
      ),
    );
  }
}
