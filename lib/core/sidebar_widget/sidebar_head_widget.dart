import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/widgets/circle_image.dart';
import 'package:provider/provider.dart';
import '../../features/users/view_model_events/users_view_model.dart';
import '../size_config.dart';
import '../widgets/text_widget_text1.dart';

class SideHeader extends StatefulWidget {
  const SideHeader({super.key});

  @override
  State<SideHeader> createState() => _SideHeaderState();
}

class _SideHeaderState extends State<SideHeader> {
  String username = "";
  String userimage = "";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<UsersViewModel>(context, listen: false).GetUserConnected();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var provider = Provider.of<UsersViewModel>(context, listen: true);
    var provideruser =
        Provider.of<UsersViewModel>(context, listen: true).userConnected;
    if (provideruser != null) {
      username = provideruser.nomComplet.toString();
      userimage = provideruser.image.toString();
    }
    return SizedBox(
        height: getProportionateScreenHeight(150),
        child: provider.loading == true
            ? Center(child: CircularProgressIndicator())
            : Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleImage(
                      image: userimage,
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
                            title: username,
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
                ),
              ));
  }
}
