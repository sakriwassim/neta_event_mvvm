import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/core/size_config.dart';
import 'package:neta_event_mvvm/core/widgets/text_widget_text2.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/register_authentification_view.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/widgets/forget_row.dart';

import '../../../core/colors.dart';
import '../../../core/string.dart';
import '../../../core/widgets/card_google_widget.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../home/bottom_navigation_bar.dart';
import '../authentification_repositories/authentification_api.dart';
import '../models_authentification/login_authentification_model.dart';
import '../view_model_authentification/authentification_view_model.dart';
import 'select_company_view.dart';
import 'widgets/sinscrire_row_widget.dart';

//****** */
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formkey = GlobalKey<FormState>();
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;
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
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Image.asset(
                  LoginImage,
                  height: getProportionateScreenHeight(100),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15)),
                      child: TextWidget(
                        title: 'Se connecter',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15)),
                  child: TextFormField(
                    decoration: textFieldDecorationWithicon(
                      "entre le email",
                      "Adresse e-mail",
                      Colors.grey,
                      message,
                    ),
                    validator: (value) {
                      String pattern = pattermail;

                      RegExp regex = RegExp(pattern);

                      if (value == null ||
                          value.isEmpty ||
                          !regex.hasMatch(value)) {
                        return "Enter a valid email address";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (text) {
                      emailfield = text;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15)),
                  child: TextFormField(
                    decoration: textFieldDecorationWithTowicon(
                      "Mot de passe",
                      "entre le password",
                      Colors.grey,
                      lockicon,
                      hiddenicon,
                    ),
                    validator: (value) {
                      String pattern = patternstring;
                      RegExp regex = RegExp(pattern);

                      if (value == null ||
                          value.isEmpty ||
                          !regex.hasMatch(value)) {
                        return "Enter a valid mot de pass";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (text) {
                      passwordfield = text;
                    },
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                const ForgetpasswordRow(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                InkWell(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        var event = {
                          "role_id": 1,
                          "packs_id": 1,
                          "nom_complet": " ",
                          "email": emailfield.toString(),
                          "telephone": 70213645,
                          "adresse": " ",
                          "image": " ",
                          "password": passwordfield.toString()
                        };

                        AuthentificationModel authentificationModel =
                            AuthentificationModel.fromJson(event);

                        bool verif = await data.Login(authentificationModel);
                        if (verif == true) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ));
                        }
                      }
                    },
                    child: Button(
                      text: "SE CONNECTER",
                      fontSize: fontSizebigbutton,
                      height: heightbigbutton,
                      width: widthbigbutton,
                      gradientbackground: gradientbackground,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                const Text(
                  "OU",
                  style: TextStyle(
                      color: Color.fromRGBO(157, 152, 152, 1), fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: CardGoogle(
                    image: imagegoogle,
                    title: titleCG,
                    height: heightgoogle,
                    width: widthgoogle,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                InkWell(
                  child: CardGoogle(
                    image: imagefacebook,
                    title: titleCF,
                    height: heightgoogle,
                    width: widthgoogle,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                SinscrireRow(
                  navtoRegisterView: navtoRegisterView,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
