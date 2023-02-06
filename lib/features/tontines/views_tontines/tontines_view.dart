import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:neta_event_mvvm/features/tontines/views_tontines/widget/list_tontine_widget.dart';
import 'package:provider/provider.dart';
import '../../../core/colors.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../events/views_events/add_event_view.dart';
import '../../users/view_model_events/users_view_model.dart';
import '../view_model_tickets/tontines_view_model.dart';
import 'one_tontine_view.dart';
import 'widget/tontine_card_H_widget.dart';

class GetAllTontineView extends StatefulWidget {
  const GetAllTontineView({super.key});

  @override
  State<GetAllTontineView> createState() => _GetAllTontineViewState();
}

class _GetAllTontineViewState extends State<GetAllTontineView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<UsersViewModel>(context, listen: false).GetUserConnected();
      Provider.of<TontinesViewModel>(context, listen: false).FetchAllTontines();
    });
  }

  @override
  Widget build(BuildContext context) {
    var provideruser = Provider.of<UsersViewModel>(context, listen: false);
    var providertontine = Provider.of<TontinesViewModel>(context, listen: true);
    var listtontine =
        Provider.of<TontinesViewModel>(context, listen: true).tontines;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        shadowColor: Colors.white,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "tontine détaille",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            provideruser.userConnected?.roleId == "0"
                ? Container()
                : InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddEventView()));
                    },
                    child: Button(
                      text: "Ajouter",
                      height: 40,
                      width: 100,
                      fontSize: 15,
                      gradientbackground: gradientbackground,
                      fontWeight: FontWeight.normal,
                      textcolor: Colors.white,
                    )),
          ],
        ),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return RefreshIndicator(
              onRefresh: () async {
                return Future.delayed(const Duration(seconds: 2));
              },
              child: Center(
                child: providertontine.loading == false
                    ? ListTontineWidget(
                        tontines: listtontine,
                      )
                    : CircularProgressIndicator(),
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
    );
  }
}
