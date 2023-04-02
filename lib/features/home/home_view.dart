// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/colors.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/features/home/widget/categories_widget.dart';
import 'package:neta_event_mvvm/search.dart';
import 'package:provider/provider.dart';
import '../../core/size_config.dart';
import '../../core/string.dart';
import '../../core/widgets/text_widget_text1.dart';
import '../Categories/view_model_categories/categories_view_model.dart';
import '../Categories/views_categories/categories_view.dart';
import '../events/view_model_events/events_view_model.dart';
import '../notification/views_notifications/notifications_view.dart';
import '../users/view_model_events/users_view_model.dart';
import 'widget/events_bycategoris_view.dart';
import '../events/views_events/events_view.dart';
import '../packs/view_model_packs/packs_view_model.dart';
import '../packs/views_packs/packs_view.dart';
import '../tontines/view_model_tickets/tontines_view_model.dart';
import '../tontines/views_tontines/tontines_view.dart';
import 'widget/events_exclusives_widget.dart';
import 'widget/packs_widget.dart';
import 'widget/tontines_widget.dart';
import 'widget/voirtout.dart';

class HomeView extends StatefulWidget {
  HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<CategoriesViewModel>(context, listen: false)
          .FetchAllCategories();
      Provider.of<TontinesViewModel>(context, listen: false).FetchAllTontines();
      Provider.of<PacksViewModel>(context, listen: false).FetchAllPacks();
      Provider.of<EventsViewModel>(context, listen: false).FetchAllEvents("");
      Provider.of<UsersViewModel>(context, listen: false).GetUserConnected();
      Provider.of<EventsViewModel>(context, listen: false)
          .GetEventByCategorie(1);
    });
  }

  navGetAllCategorieView() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GetAllCategorieView()),
    );
  }

  navGetAllEventView() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GetAllEventView()),
    );
  }

  navGetAllPackView() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GetAllPackView()),
    );
  }

  navGetAllTontineView() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GetAllTontineView()),
    );
  }

  navGetAllNotificationView() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GetAllNotificationView()),
    );
  }

  comingsoon() {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextAirbnbCereal(
                    color: Color.fromARGB(255, 6, 222, 196), //4F4F4F
                    fontWeight: FontWeight.w500,
                    size: 18,
                    title: "Bientôt Disponible",
                  ),
                  Container(
                    height: 150,
                    child: Image.asset(coming_soon),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  Widget SearchWidget() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () {
                showSearch(context: context, delegate: SearchElement());
              },
              child: SvgPicture.asset(search)),
          SvgPicture.asset(Line),
          SizedBox(
            width: getProportionateScreenWidth(180),
            child: TextField(
              onTap: (() {
                showSearch(context: context, delegate: SearchElement());
              }),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Chercher',
                hintStyle: TextStyle(
                    fontFamily: 'AirbnbCereal',
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Color.fromARGB(137, 255, 255, 255)),
              ),
            ),
          ),
          InkWell(
            onTap: () => comingsoon(),
            child: Container(
                height: heightfliterbutton,
                width: widthfliterbutton,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: const Color(0xFF701D53),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(filtercircle),
                    TextAirbnbCereal(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      size: 15,
                      title: 'Filtres',
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var provider = Provider.of<CategoriesViewModel>(context, listen: false);
    var providertontine =
        Provider.of<TontinesViewModel>(context, listen: false);
    var providerpack = Provider.of<PacksViewModel>(context, listen: false);
    var provideruser = Provider.of<UsersViewModel>(context, listen: true);
    var providerevent = Provider.of<EventsViewModel>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            height: getProportionateScreenHeight(150),
            decoration: const BoxDecoration(
                gradient: gradientbackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(20),
                      horizontal: getProportionateScreenWidth(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      provideruser.userConnected?.roleId == "3"
                          ? Container()
                          : InkWell(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    shape: BoxShape.circle,
                                    gradient: gradientbackground),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                    ProfileBnt,
                                    width: 15,
                                  ),
                                ),
                              ),
                            ),
                      Column(
                        children: [
                          const Text(
                            "Hey Bienvenue..",
                            style: TextStyle(
                              fontFamily: 'AirbnbCereal',
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Color.fromARGB(135, 255, 255, 255),
                            ),
                          ),
                          provideruser.userConnected != null
                              ? Text(
                                  "${provideruser.userConnected?.nomComplet}",
                                  style: const TextStyle(
                                    fontFamily: 'AirbnbCereal',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      provideruser.userConnected?.roleId == "3"
                          ? Container()
                          : Row(
                              children: [
                                IconButton(
                                    icon: const Icon(
                                      Icons.favorite_border_sharp,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      comingsoon();
                                    }),
                                IconButton(
                                    icon: SvgPicture.asset(Notif),
                                    onPressed: () {
                                      navGetAllNotificationView();
                                    }),
                              ],
                            ),
                    ],
                  ),
                ),
                provideruser.userConnected?.roleId == "3"
                    ? Container()
                    : SearchWidget()
              ],
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
                      setState(() {});

                      return Future.delayed(const Duration(seconds: 2));
                    },
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //****************** Exclusives*/

                              provideruser.userConnected?.roleId == "3"
                                  ? Container()
                                  : VoirTout(
                                      text: 'Exclusives',
                                      callbackfonction: navGetAllEventView,
                                    ),

                              provideruser.userConnected?.roleId == "3"
                                  ? Container()
                                  : EventsExclusivesWidget(
                                      eventsexclusives: providerevent.allEvents,
                                    ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(15),
                                ),
                                child: const Text(
                                  "Catégories",
                                  style: TextStyle(
                                    fontFamily: 'AirbnbCereal',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),

                              CategoriesWidgetHome(
                                categories: provider.categories,
                              ),

                              VoirTout(
                                text: 'Evènements',
                                callbackfonction: navGetAllEventView,
                              ),
                              GetEventByCategorisWidget(
                                eventsbyCategorie:
                                    providerevent.eventsbyCategorie,
                              ),

                              provideruser.userConnected?.roleId == "1" ||
                                      provideruser.userConnected?.roleId == "3"
                                  ? Container()
                                  : Column(
                                      children: [
                                        VoirTout(
                                          text: 'Packs',
                                          callbackfonction: navGetAllPackView,
                                        ),
                                        PacksWidgetHome(
                                            packs: providerpack.packs),
                                      ],
                                    ),

                              provideruser.userConnected?.roleId == "3"
                                  ? Container()
                                  : VoirTout(
                                      text: 'Tontine',
                                      callbackfonction: navGetAllTontineView,
                                    ),

                              provideruser.userConnected?.roleId == "3"
                                  ? Container()
                                  : TontinesWidgetHome(
                                      tontines: providertontine.tontines,
                                    ),
                            ],
                          ),
                        ),
                      ],
                    )),
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
        ]),
      ),
    );
  }
}
