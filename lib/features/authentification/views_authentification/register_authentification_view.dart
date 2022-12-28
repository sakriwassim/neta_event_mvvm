import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/string.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/widgets/register_row.dart';

import '../../../core/colors.dart';
import '../../../core/decoration.dart';
import '../../../core/int.dart';
import '../../../core/size_config.dart';
import '../../../core/widgets/card_google_widget.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../authentification_repositories/authentification_api.dart';
import '../view_model_authentification/authentification_view_model.dart';
import 'select_company_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formkey = GlobalKey<FormState>();
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;
  late String passwordfield2;

  var data = AuthentificationViewModel(
      authentificationRepository: AuthentificationApi());

  navtoSinscrireRow() {
    Navigator.pop(context);
  }

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
      ),
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
                          horizontal: getProportionateScreenWidth(100)),
                      child: TextAirbnbCereal(
                        title: "S'inscrire",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    Spacer()
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
                      "entre le ",
                      "Sanogo Yaya",
                      Colors.grey,
                      Profile,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter a valid email address";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (text) {
                      nomcompletfield = text;
                    },
                  ),
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
                SizedBox(
                  height: getProportionateScreenHeight(15),
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
                      } else if (passwordfield == passwordfield2) {
                        return null;
                      } else {
                        return "vérifier votre mot de passe";
                      }
                    },
                    onChanged: (text) {
                      passwordfield2 = text;
                    },
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                InkWell(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectCompany(
                                  nomcompletfield: nomcompletfield,
                                  emailfield: emailfield,
                                  passwordfield: passwordfield),
                            ));
                      }
                    },
                    child: Button(
                      text: "S'INSCRIRE",
                      fontSize: fontSizebigbutton,
                      height: heightbigbutton,
                      width: widthbigbutton,
                      gradientbackground: gradientbackground,
                      fontWeight: FontWeight.w500,
                      textcolor: Colors.white,
                    )),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                const Text(
                  "OU",
                  style: TextStyle(
                      color: Color.fromRGBO(157, 152, 152, 1), fontSize: 16),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                InkWell(
                  onTap: () {},
                  child: CardGoogle(
                    image: imagegoogle,
                    title: 'Se connecter avec Google',
                    height: heightgoogle,
                    width: widthgoogle,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: CardGoogle(
                    image: imagefacebook,
                    title: 'Se connecter avec Facebook',
                    height: heightgoogle,
                    width: widthgoogle,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                RegisterRow(
                  navtoRegisterView: navtoSinscrireRow,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
