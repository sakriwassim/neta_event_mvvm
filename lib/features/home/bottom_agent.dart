// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:neta_event_mvvm/features/authentification/views_authentification/authentification_view.dart';
// import 'package:neta_event_mvvm/features/home/home_view_agent.dart';
// import 'package:neta_event_mvvm/features/home/widget/bottom_btn_widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../core/colors.dart';
// import '../../core/size_config.dart';
// import '../../core/string.dart';
// import '../events/evants_repositories/events_api.dart';
// import '../events/view_model_events/events_view_model.dart';

// class MyHomePageAgent extends StatefulWidget {
//   const MyHomePageAgent({super.key});

//   @override
//   _MyHomePageAgentState createState() => _MyHomePageAgentState();
// }

// class _MyHomePageAgentState extends State<MyHomePageAgent> {
//   var data = EventsViewModel();

//   int _currentIndex = 0;

//   List Screen = [
//     HomeViewAgent(),
//   ];

//   final PageStorageBucket bucket = PageStorageBucket();
//   Widget currentScreen = HomeViewAgent();

//   GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

//   // var dataAuthentificationViewModel = AuthentificationViewModel(
//   //     authentificationRepository: AuthentificationApi());

//   navtologin() async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool("isLoggedIn", false);
//     prefs.remove("token");
//     // ignore: use_build_context_synchronously
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => AuthView()));
//   }

//   Widget bottomwidget(String iconoff, String iconon, String text, int Index) {
//     return Expanded(
//       child: MaterialButton(
//         minWidth: getProportionateScreenWidth(40),
//         onPressed: () {
//           setState(() {
//             currentScreen = Screen[Index];
//             _currentIndex = Index;
//             Index == 1 ? navtologin() : null;
//           });
//         },
//         child: bottomBtnwidget(
//           Index: Index,
//           currentIndex: _currentIndex,
//           iconoff: iconoff,
//           iconon: iconon,
//           text: text,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     return Scaffold(
//       key: _scaffoldState,
//       backgroundColor: Colors.white,
//       body: PageStorage(
//         bucket: bucket,
//         child: currentScreen,
//       ),
//       floatingActionButton: FloatingActionButton(
//           backgroundColor:
//               const Color.fromARGB(116, 216, 4, 202).withOpacity(0.5),
//           mini: false,
//           onPressed: () {
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(builder: (context) => OneUserView()),
//             // );
//           },
//           child: Container(
//             decoration: const BoxDecoration(
//                 shape: BoxShape.circle, gradient: gradientbackground),
//             child: Padding(
//               padding: const EdgeInsets.all(15),
//               child: SvgPicture.asset(
//                 "assets/icons/home/scan.svg",
//                 width: 28,
//               ),
//             ),
//           )),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         shape: const CircularNotchedRectangle(),
//         notchMargin: 10,
//         child: SizedBox(
//           height: getProportionateScreenHeight(70),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               bottomwidget(CompassOff, Compass, 'Découvrir', 0),
//               bottomwidget(Deconnect, Deconnect, 'Deconnection', 1),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
