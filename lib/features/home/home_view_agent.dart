// import 'package:flutter/material.dart';
// import 'package:flutter_offline/flutter_offline.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:neta_event_mvvm/features/home/widget/events_bycategoris_view.dart';
// import 'package:neta_event_mvvm/features/home/widget/voirtout.dart';
// import 'package:provider/provider.dart';

// import '../../core/colors.dart';
// import '../../core/int.dart';
// import '../../core/size_config.dart';
// import '../../core/string.dart';
// import '../../core/widgets/text_widget_text1.dart';
// import '../../search.dart';
// import '../Categories/view_model_categories/categories_view_model.dart';
// import '../Categories/view_model_categories/one_categorie_view_model.dart';
// import '../Categories/views_categories/categories_view.dart';
// import '../Categories/views_categories/widget/categorie_card_widget.dart';
// import '../authentification/view_model_authentification/authentification_view_model.dart';

// import '../events/view_model_events/events_view_model.dart';
// import '../events/views_events/events_view.dart';
// import '../packs/view_model_packs/packs_view_model.dart';
// import '../tontines/view_model_tickets/tontines_view_model.dart';
// import '../users/view_model_events/users_view_model.dart';

// class HomeViewAgent extends StatefulWidget {
//   HomeViewAgent({super.key});

//   @override
//   State<HomeViewAgent> createState() => _HomeViewAgentState();
// }

// class _HomeViewAgentState extends State<HomeViewAgent> {
//   navGetAllCategorieView() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const GetAllCategorieView()),
//     );
//   }

//   navGetAllEventView() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const GetAllEventView()),
//     );
//   }

//   int indexCategories = 0;

//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       Provider.of<CategoriesViewModel>(context, listen: false)
//           .FetchAllCategories();
//       Provider.of<TontinesViewModel>(context, listen: false).FetchAllTontines();
//       Provider.of<PacksViewModel>(context, listen: false).FetchAllPacks();
//       Provider.of<EventsViewModel>(context, listen: false).FetchAllEvents("");
//       Provider.of<AuthentificationViewModel>(context, listen: false).tokenModel;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var providercategorie =
//         Provider.of<CategoriesViewModel>(context, listen: false);
//     var providertontine =
//         Provider.of<TontinesViewModel>(context, listen: false);
//     var providerpack = Provider.of<PacksViewModel>(context, listen: false);
//     var provideruser = Provider.of<UsersViewModel>(context, listen: false);

//     var providerevent = Provider.of<EventsViewModel>(context, listen: false);

//     return Scaffold(
//       body: SafeArea(
//         child: Column(children: [
//           Container(
//             height: getProportionateScreenHeight(150),
//             decoration: const BoxDecoration(
//                 gradient: gradientbackground,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(25),
//                   bottomRight: Radius.circular(25),
//                 )),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       vertical: getProportionateScreenHeight(20),
//                       horizontal: getProportionateScreenWidth(10)),
//                   child: Column(
//                     children: [
//                       const Text(
//                         "le agent",
//                         style: TextStyle(
//                           fontFamily: 'AirbnbCereal',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 15,
//                           color: Color.fromARGB(135, 255, 255, 255),
//                         ),
//                       ),
//                       Text(
//                         "${provideruser.userConnected!.nomComplet}",
//                         style: const TextStyle(
//                           fontFamily: 'AirbnbCereal',
//                           fontWeight: FontWeight.w500,
//                           fontSize: 19,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       InkWell(
//                           onTap: () {
//                             showSearch(
//                                 context: context, delegate: SearchElement());
//                           },
//                           child: SvgPicture.asset(search)),
//                       SvgPicture.asset(Line),
//                       SizedBox(
//                         width: getProportionateScreenWidth(180),
//                         child: TextField(
//                           onTap: (() {
//                             showSearch(
//                                 context: context, delegate: SearchElement());
//                           }),
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'Chercher',
//                             hintStyle: TextStyle(
//                                 fontFamily: 'AirbnbCereal',
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 15.0,
//                                 color: Color.fromARGB(137, 255, 255, 255)),
//                           ),
//                         ),
//                       ),
//                       Container(
//                           height: heightfliterbutton,
//                           width: widthfliterbutton,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50.0),
//                             color: const Color(0xFF701D53),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               SvgPicture.asset(filtercircle),
//                               TextAirbnbCereal(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w400,
//                                 size: 15,
//                                 title: 'Filtres',
//                               ),
//                             ],
//                           )),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: OfflineBuilder(
//               connectivityBuilder: (
//                 BuildContext context,
//                 ConnectivityResult connectivity,
//                 Widget child,
//               ) {
//                 final bool connected = connectivity != ConnectivityResult.none;
//                 if (connected) {
//                   return RefreshIndicator(
//                       onRefresh: () async {
//                         setState(() {});

//                         return Future.delayed(const Duration(seconds: 2));
//                       },
//                       child: SingleChildScrollView(
//                           child: Column(
//                         children: [
//                           SizedBox(
//                             height: getProportionateScreenHeight(10),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: getProportionateScreenWidth(10)),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 /******Exclusives********************************* */

//                                 SizedBox(
//                                   height: getProportionateScreenHeight(10),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: getProportionateScreenWidth(15),
//                                   ),
//                                   child: const Text(
//                                     "Catégories",
//                                     style: TextStyle(
//                                       fontFamily: 'AirbnbCereal',
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 18,
//                                       color: Color.fromARGB(255, 0, 0, 0),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: getProportionateScreenHeight(150),
//                                   child: FutureBuilder<
//                                       List<OneCategorieViewModel>>(
//                                     //future: datacategorie.FetchAllCategories(),
//                                     builder: ((context, snapshot) {
//                                       if (!snapshot.hasData) {
//                                         return const Center(
//                                             // child: CircularProgressIndicator()
//                                             );
//                                       } else {
//                                         var categories = snapshot.data;
//                                         return ListView.builder(
//                                             shrinkWrap: true,
//                                             scrollDirection: Axis.horizontal,
//                                             itemCount: categories?.length,
//                                             itemBuilder: (context, index) =>
//                                                 InkWell(
//                                                   onTap: () {
//                                                     indexCategories = index;

//                                                     setState(() {
//                                                       // data.GetEventByCategorie(
//                                                       //     2);
//                                                     });
//                                                   },
//                                                   child: CategorieCardWidget(
//                                                     libelle: categories![index]
//                                                         .libelle,
//                                                     image:
//                                                         categories[index].image,
//                                                   ),
//                                                 ));
//                                       }
//                                     }),
//                                   ),
//                                 ),
//                                 VoirTout(
//                                   text: 'Evènements',
//                                   callbackfonction: navGetAllEventView,
//                                 ),
//                                 GetEventByCategorisWidget(
//                                   categorieid: indexCategories,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       )));
//                 } else {
//                   return const Center(
//                     child: Text("no connection"),
//                   );
//                 }
//               },
//               child: const CircularProgressIndicator(),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
