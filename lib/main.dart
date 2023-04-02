import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:neta_event_mvvm/core/theme_data.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/authentification_view.dart';
import 'features/Categories/view_model_categories/categories_view_model.dart';
import 'features/authentification/view_model_authentification/authentification_view_model.dart';
import 'features/events/view_model_events/events_view_model.dart';
import 'features/home/bottom_navigation_bar.dart';
import 'features/into_screen/view/intro_page.dart';
import 'features/packs/view_model_packs/packs_view_model.dart';
import 'features/tickets/view_model_tickets/tickets_view_model.dart';
import 'features/tontines/view_model_tickets/tontines_view_model.dart';
import 'features/users/view_model_events/users_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
  final skipinto = prefs.getBool("skipinto") ?? false;

  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthentificationViewModel>(
        create: (_) => AuthentificationViewModel(),
      ),
      ChangeNotifierProvider<CategoriesViewModel>(
        create: (_) => CategoriesViewModel(),
      ),
      ChangeNotifierProvider<TontinesViewModel>(
        create: (_) => TontinesViewModel(),
      ),
      ChangeNotifierProvider<PacksViewModel>(
        create: (_) => PacksViewModel(),
      ),
      ChangeNotifierProvider<TicketsViewModel>(
        create: (_) => TicketsViewModel(),
      ),
      ChangeNotifierProvider<EventsViewModel>(
        create: (_) => EventsViewModel(),
      ),
      ChangeNotifierProvider<UsersViewModel>(
        create: (_) => UsersViewModel(),
      ),
    ],
    child: MyApp(
      isLoggedIn: isLoggedIn,
      skipinto: skipinto,
    ),
  ));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final bool skipinto;
  const MyApp({
    Key? key,
    required this.isLoggedIn,
    required this.skipinto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: themedata(),
        home: //AddTontineView()
            skipinto
                ? isLoggedIn
                    ? MyHomePage()
                    : AuthView()
                : const IntoScreen());
  }
}
