import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/register_authentification_view.dart';

import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../authentification/views_authentification/login_authentification_view.dart';

class LoginSignupView extends StatefulWidget {
  @override
  State<LoginSignupView> createState() => _LoginSignupViewState();
}

class _LoginSignupViewState extends State<LoginSignupView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TabBar(
                      indicatorColor: const Color.fromARGB(255, 214, 9, 204),
                      isScrollable: true,
                      controller: _tabController,
                      labelColor: Color.fromARGB(255, 214, 9, 204),
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Se connecte",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Button(
                              text: "S'inscrire",
                              fontSize: fontSizemediumbutton,
                              gradientbackground: gradientbackground,
                              height: heightmediumbutton,
                              width: widthmediumbutton,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.lightGreen,
                      )),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        color: Colors.grey,
                        child: SizedBox(
                          width: double.maxFinite,
                          height: 500,
                          child: TabBarView(
                            children: [
                              Container(child: LoginView()),
                              Container(child: RegisterView()),
                            ],
                            controller: _tabController,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  color: Color.fromARGB(255, 183, 143, 179),
                ))
          ],
        ),
      ),
    );
  }
}
