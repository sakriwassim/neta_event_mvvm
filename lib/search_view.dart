// import 'package:flutter/material.dart';
// import 'package:flutter_offline/flutter_offline.dart';
// import 'package:neta_event_mvvm/search.dart';

// import 'features/events/evants_repositories/events_api.dart';
// import 'features/events/view_model_events/events_view_model.dart';
// import 'features/users/evants_repositories/events_api.dart';
// import 'features/users/view_model_events/events_view_model.dart';
// import 'features/users/view_model_events/one_event_view_model.dart';
// import 'features/users/views_events/one_event_view.dart';
// import 'features/users/views_events/widgets/event_card_widget.dart';

// class SearshPage extends StatefulWidget {
//   const SearshPage({super.key});

//   @override
//   State<SearshPage> createState() => _SearshPageState();
// }

// class _SearshPageState extends State<SearshPage> {
//   var data = EventsViewModel(eventsRepository: EventsApi());

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("search"),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () {
//                 showSearch(context: context, delegate: SearchElement());
//               },
//             )
//           ],
//         ),
//         body: Column(
//           children: [
//             TextField(),
//             Expanded(
//               child: OfflineBuilder(
//                 connectivityBuilder: (
//                   BuildContext context,
//                   ConnectivityResult connectivity,
//                   Widget child,
//                 ) {
//                   final bool connected =
//                       connectivity != ConnectivityResult.none;
//                   if (connected) {
//                     return RefreshIndicator(
//                       onRefresh: () async {
//                         return Future.delayed(const Duration(seconds: 2));
//                       },
//                       child: Center(
//                         child: FutureBuilder<List<OneUserViewModel>>(
//                           future: data.FetchAllEvents(),
//                           builder: ((context, snapshot) {
//                             if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return const CircularProgressIndicator();
//                             } else {
//                               var events = snapshot.data;
//                               return ListView.builder(
//                                   itemCount: events?.length,
//                                   itemBuilder: (context, index) =>
//                                       GestureDetector(
//                                           onTap: () {
//                                             Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       OnUserView(
//                                                         id: events![index].id,
//                                                       )),
//                                             );
//                                           },
//                                           child: UserCardWidget(
//                                             description: events![index].adresse,
//                                             events: events,
//                                             date_heure: events![index].adresse,
//                                             libelle: events![index].nom_complet,
//                                             prix: events![index].email,
//                                             adresse: events![index].adresse,
//                                           )));
//                             }
//                           }),
//                         ),
//                       ),
//                     );
//                   } else {
//                     return const Center(
//                       child: Text("no connection"),
//                     );
//                   }
//                 },
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const <Widget>[
//                     Text(
//                       'There are no bottons to push :)',
//                     ),
//                     Text(
//                       'Just turn off your internet.',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
