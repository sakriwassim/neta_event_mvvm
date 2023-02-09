import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/widgets/small_button_style.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/events_view_model.dart';
import 'package:neta_event_mvvm/features/events/views_events/add_event_view.dart';
import 'package:provider/provider.dart';
import '../../../core/colors.dart';
import '../../../core/size_config.dart';
import '../../../core/string.dart';
import '../../../search.dart';
import '../../users/view_model_events/users_view_model.dart';
import 'widgets/events_widget.dart';

class GetAllEventView extends StatefulWidget {
  const GetAllEventView({super.key});

  @override
  State<GetAllEventView> createState() => _GetAllEventViewState();
}

class _GetAllEventViewState extends State<GetAllEventView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<EventsViewModel>(context, listen: false).FetchAllEvents("");
      Provider.of<UsersViewModel>(context, listen: false).GetUserConnected();
    });
  }

  final searchcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var providerevent = Provider.of<EventsViewModel>(context, listen: true);
    var provideruser = Provider.of<UsersViewModel>(context, listen: true);

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
                providerevent.title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              provideruser.userConnected?.roleId == "0" ||
                      provideruser.userConnected?.roleId == "4"
                  ? Container()
                  : InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddEventView()));
                      },
                      child: Button(
                        text: "ADD EVENT",
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
        body: Column(
          children: [
            Container(
              color: Colors.white,
              height: getProportionateScreenHeight(60),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      height: getProportionateScreenHeight(30),
                      width: getProportionateScreenWidth(30),
                      child: InkWell(
                        onTap: () {
                          showSearch(
                              context: context, delegate: SearchElement());
                        },
                        child: SvgPicture.asset(searchcolor),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    SvgPicture.asset(Lineevent),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Container(
                      width: getProportionateScreenWidth(180),
                      child: TextField(
                        controller: searchcontroler,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Chercher',
                          hintStyle: TextStyle(
                            fontFamily: 'AirbnbCereal',
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: OfflineBuilder(
                  connectivityBuilder: (
                    BuildContext context,
                    ConnectivityResult connectivity,
                    Widget child,
                  ) {
                    final bool connected =
                        connectivity != ConnectivityResult.none;
                    if (connected) {
                      return providerevent.loading
                          ? Center(child: CircularProgressIndicator())
                          : EventsWidget(
                              events: providerevent.allEvents,
                            );
                    } else {
                      return const Center(
                        child: Text("no connection"),
                      );
                    }
                  },
                  child: Container()),
            ),
          ],
        ));
  }
}
