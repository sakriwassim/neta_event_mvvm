import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/features/user/view_user/user_view.dart';

import '../../../core/widgets/medium_button.dart';
import '../user_repositories/user_api.dart';
import '../view_model_user/user_view_model.dart';

class OneUserView extends StatefulWidget {
  @override
  State<OneUserView> createState() => _OneUserViewState();
}

class _OneUserViewState extends State<OneUserView> {
  final formkey = GlobalKey<FormState>();
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;

  var data = UserViewModel(userRepository: UserApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          shadowColor: Colors.white,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            "Profile",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      child: ClipOval(
                          child: Image.asset("assets/profileimage.png")),
                    ),
                    Text(
                      "Sakri wassim",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text("420"),
                                Text("ticket"),
                              ],
                            ),
                            Column(
                              children: [
                                Text("1800\$"),
                                Text("spent"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserView(),
                              ));
                        },
                        child: MediumButton(
                          text: "Edit",
                        )),
                    Text(" fdsjfhdkjf ds fsjd khsf  hfkj dkjs"),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.grey,
                          size: 40.0,
                        ),
                        Text("sakriwassim@gmail.com")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.grey,
                          size: 40.0,
                        ),
                        Text("sakriwassim@gmail.com")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.grey,
                          size: 40.0,
                        ),
                        Text("sakriwassim@gmail.com")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.grey,
                          size: 40.0,
                        ),
                        Text("sakriwassim@gmail.com")
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
