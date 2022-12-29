import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/register_authentification_view.dart';

import '../../../core/colors.dart';
import '../../../core/size_config.dart';
import '../../../core/widgets/select_button.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../../home/bottom_navigation_bar.dart';
import '../authentification_repositories/authentification_api.dart';
import '../models_authentification/login_authentification_model.dart';
import '../view_model_authentification/authentification_view_model.dart';

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

  int selectIndex = -1;

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
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const RegisterView(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15)),
                      child: TextAirbnbCereal(
                        title: "S'inscrire",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: List.generate(3, (index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectIndex = index;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(10)),
                        child: SelectButton(
                          isSelected: selectIndex == index
                              ? buttonselected = true
                              : buttonselected = false,
                          text: index == 0
                              ? "CLIENT"
                              : index == 1
                                  ? "ORGANISATEUR"
                                  : "SOCIÉTÉ",
                          fontSize: fontSizebigbutton,
                          height: heightselectbutton,
                          width: widthselectbutton,
                          gradientbackground: gradientbackground,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                    onTap: () async {
                      //print("il button ti5dem ");
                      var event = {
                        "role_id": selectIndex,
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
                      textcolor: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
