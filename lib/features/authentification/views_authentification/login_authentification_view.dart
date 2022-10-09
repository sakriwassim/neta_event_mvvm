import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:neta_event_mvvm/core/widgets/big_button_style.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/register_authentification_view.dart';

import '../../../home_page.dart';
import '../authentification_repositories/authentification_api.dart';
import '../models_authentification/login_authentification_model.dart';
import '../view_model_authentification/authentification_view_model.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formkey = GlobalKey<FormState>();
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;
  bool _isObscure = true;

  var data = AuthentificationViewModel(
      authentificationRepository: AuthentificationApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   shadowColor: Colors.white,
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Image.asset(
                  'assets/SlashScreen/netaLogo.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 25.0,
                        right: 5.0,
                        top: 10,
                        bottom: 16,
                      ),
                      child: Text(
                        "Se connecter",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: textFieldDecorationWithicon(
                      "entre le email",
                      "Adresse e-mail",
                      Icons.mail,
                      Colors.grey,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "entre le email";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (text) {
                      emailfield = text;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: textFieldDecorationWithicon(
                      "Mot de passe",
                      "entre le password",
                      Icons.lock_outline,
                      Colors.grey,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "entre le password";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (text) {
                      passwordfield = text;
                    },
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      children: [
                        // FlutterSwitch(
                        // activeColor: Colors.purple,
                        // width: 55.0,
                        // height: 25.0,
                        // valueFontSize: 20.0,
                        // toggleSize: 30.0,
                        // value: trSwitch,
                        // borderRadius: 30.0,
                        // padding: 4.0,
                        // showOnOff: false,
                        // onToggle: (val) {
                        //   setState(() {
                        //     trSwitch = val;
                        //   });
                        // },
                        // ),
                        Text(
                          " Se rappeler",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "mot de passe oublié?",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        var event = {
                          "role_id": 1,
                          "packs_id": 1,
                          "nom_complet": "Mousa Keita",
                          "email": emailfield.toString(),
                          "telephone": 70213645,
                          "adresse": "Faladiè",
                          "image": "https://cheminverslimage",
                          "password": passwordfield.toString()
                        };

                        AuthentificationModel authentificationModel =
                            AuthentificationModel.fromJson(event);

                        bool verif = await data.Login(authentificationModel);
                        if (verif == true) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ));
                        }
                      }
                    },
                    child: BigButton(
                      text: "SE CONNECTER",
                    )),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          height: 60,
                          padding: EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            top: 10,
                            bottom: 5,
                          ),
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/SlashScreen/google.png',
                                width: MediaQuery.of(context).size.width * 0.1,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                //scale: 0.1,
                              ),
                              Expanded(
                                child: Text(
                                  "Se conncter avec Google",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.72,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          height: 60,
                          padding: EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            top: 10,
                            bottom: 5,
                          ),
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/SlashScreen/Facebook.png',
                                width: MediaQuery.of(context).size.width * 0.1,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                //scale: 0.1,
                              ),
                              Expanded(
                                child: Text(
                                  " Se conncter avec Facebook",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Row contents vertically,
                    children: [
                      Text(
                        " Vous n'avez pas un compte",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterView(),
                              ));
                        },
                        child: Text(
                          " S'inscrire",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // InputDecoration textFieldDecoration() {
  //   return const InputDecoration(
  //                   filled: true,
  //                   fillColor: Color(0xFFF2F2F2),
  //                   focusedBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.all(Radius.circular(4)),
  //                     borderSide: BorderSide(
  //                         width: 1, color: Color.fromARGB(255, 255, 0, 208)),
  //                   ),
  //                   border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.all(Radius.circular(4)),
  //                       borderSide: BorderSide(
  //                         width: 1,
  //                       )),
  //                   labelText: 'Adresse e-mail',
  //                   prefixIcon: Icon(
  //                     Icons.mail_outline_outlined,
  //                     color: Colors.grey,
  //                   ),
  //                   labelStyle: TextStyle(
  //                     color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
  //                   ),
  //                   hintText: 'entre le email',
  //                 );
  // }

}
