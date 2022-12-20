import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/core/widgets/text_widget_text2.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/register_authentification_view.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/widgets/forget_row.dart';

import '../../../core/colors.dart';
import '../../../core/string.dart';
import '../../../core/widgets/card_google_widget.dart';
import '../../../core/widgets/select_button.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../home/bottom_navigation_bar.dart';
import '../authentification_repositories/authentification_api.dart';
import '../models_authentification/login_authentification_model.dart';
import '../view_model_authentification/authentification_view_model.dart';
import 'widgets/sinscrire_row_widget.dart';

//****** */
class SelectCompany extends StatefulWidget {
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;

  SelectCompany(
      {super.key,
      required this.nomcompletfield,
      required this.emailfield,
      required this.passwordfield});

  @override
  State<SelectCompany> createState() => _SelectCompanyState();
}

class _SelectCompanyState extends State<SelectCompany> {
  final formkey = GlobalKey<FormState>();

  late int valueselected = 1;
  bool buttonselected = false;

//  final bool _isObscure = true;

  var data = AuthentificationViewModel(
      authentificationRepository: AuthentificationApi());

  navtoForgetpasswordRow() {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => Forgetpassword(),
    //     ));
  }

  navtoRegisterView() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterView(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextWidget(
                        title: "S'inscrire",
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                    onTap: () {
                      valueselected = 1;
                      print(valueselected);
                    },
                    child: SelectButtonTrue(
                      text: "CLIENT",
                      fontSize: fontSizebigbutton,
                      height: heightselectbutton,
                      width: widthselectbutton,
                      gradientbackground: gradientbackground,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () {
                      valueselected = 2;
                      print(valueselected);
                    },
                    child: SelectButtonFalse(
                      text: "ORGANISATEUR",
                      fontSize: fontSizebigbutton,
                      height: heightselectbutton,
                      width: widthselectbutton,
                      gradientbackground: gradientbackground,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () {
                      valueselected = 3;
                      print(valueselected);
                    },
                    child: SelectButtonTrue(
                      text: "SOCIÉTÉS",
                      fontSize: fontSizebigbutton,
                      height: heightselectbutton,
                      width: widthselectbutton,
                      gradientbackground: gradientbackground,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                    onTap: () async {
                      print("il button ti5dem ");
                      var event = {
                        "role_id": valueselected,
                        "packs_id": 1,
                        "nom_complet": widget.nomcompletfield.toString(),
                        "email": widget.emailfield.toString(),
                        "telephone": 70213645,
                        "adresse": "Faladiè",
                        "image": "https://cheminverslimage",
                        "password": widget.passwordfield.toString()
                      };

                      AuthentificationModel authentificationModel =
                          AuthentificationModel.fromJson(event);

                      bool verif = await data.Register(authentificationModel);
                      if (verif == true) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHomePage(),
                            ));
                      }
                    },
                    child: Button(
                      text: "VALIDER",
                      fontSize: fontSizebigbutton,
                      height: heightbigbutton,
                      width: widthbigbutton,
                      gradientbackground: gradientbackground,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
