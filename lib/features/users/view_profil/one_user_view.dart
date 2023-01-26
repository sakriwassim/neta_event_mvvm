import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/features/users/view_profil/user_view.dart';
import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/size_config.dart';
import '../../../core/string.dart';
import '../../../core/widgets/image_cached_internet.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../evants_repositories/events_api.dart';
import '../view_model_events/events_view_model.dart';

class OneUserView extends StatefulWidget {
  const OneUserView({super.key});

  @override
  State<OneUserView> createState() => _OneUserViewState();
}

class _OneUserViewState extends State<OneUserView> {
  final formkey = GlobalKey<FormState>();
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;
  // late TokenModel userconnectedit;

  var data = UsersViewModel(eventsRepository: UsersApi());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          shadowColor: Colors.white,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            "Profile",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: data.GetUserConnected(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(150),
                      width: getProportionateScreenWidth(150),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: ImageCachedInternet(
                            height: MediaQuery.of(context).size.height,
                            imageUrl: '${snapshot.data!.image}',
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Text(
                      snapshot.data!.nom_complet,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(right: 10, left: 10),
                    //       child: Column(
                    //         children: [
                    //           TextAirbnbCereal(
                    //             title: "420",
                    //             fontWeight: FontWeight.normal,
                    //             size: 18,
                    //             color: Colors.black,
                    //           ),
                    //           const Text(
                    //             "ticket",
                    //             style: TextStyle(color: Colors.grey),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     SvgPicture.asset(Line2),
                    //     Padding(
                    //       padding: const EdgeInsets.only(right: 10, left: 10),
                    //       child: Column(
                    //         children: [
                    //           TextAirbnbCereal(
                    //             title: "1800\$",
                    //             fontWeight: FontWeight.normal,
                    //             size: 18,
                    //             color: Colors.black,
                    //           ),
                    //           const Text(
                    //             "spent",
                    //             style: TextStyle(color: Colors.grey),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserView(),
                              ));
                        },
                        child: Button(
                          fontWeight: FontWeight.w500,
                          text: "Edit Profile",
                          fontSize: fontSizemediumbutton,
                          gradientbackground: gradientbackground,
                          height: heightmediumbutton,
                          width: widthmediumbutton,
                          textcolor: Colors.white,
                        )),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(50)),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              Profile), //message // SvgPicture.asset(Locationoff),
                          SizedBox(
                            width: getProportionateScreenWidth(20),
                          ),
                          Text(
                            snapshot.data!.nom_complet,
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(50)),
                      child: Row(
                        children: [
                          SvgPicture.asset(message),
                          SizedBox(
                            width: getProportionateScreenWidth(20),
                          ),
                          Text(
                            snapshot.data!.email,
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(50)),
                      child: Row(
                        children: [
                          SvgPicture.asset(Locationoff),
                          SizedBox(
                            width: getProportionateScreenWidth(20),
                          ),
                          Text(
                            snapshot.data!.adresse,
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(50)),
                      child: Row(
                        children: [
                          SvgPicture.asset(Chat),
                          SizedBox(
                            width: getProportionateScreenWidth(20),
                          ),
                          Text(
                            snapshot.data!.telephone,
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            }),
          ),
        ),
      ),
    );
  }
}
