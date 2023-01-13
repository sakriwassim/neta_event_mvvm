import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/core/size_config.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/select_company_view.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/widgets/forget_row.dart';
import 'package:neta_event_mvvm/features/users/evants_repositories/event_repository.dart';
import 'package:neta_event_mvvm/features/users/evants_repositories/events_api.dart';
import 'package:neta_event_mvvm/features/users/view_model_events/events_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/colors.dart';
import '../../../core/string.dart';
import '../../../core/widgets/card_google_widget.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../../../main.dart';
import '../../home/bottom_navigation_bar.dart';
import '../../home/main_home_page.dart';
import '../authentification_repositories/authentification_api.dart';
import '../models_authentification/login_authentification_model.dart';
import '../view_model_authentification/authentification_view_model.dart';

//****** */
class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final formkey = GlobalKey<FormState>();
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;

  late String passwordfield2;

  bool _obscureText = true;

  bool isSwitched = true;

  bool isLogin = true;

  // final navigatorKey = GlobalKey<NavigatorState>();

  var data = AuthentificationViewModel(
      authentificationRepository: AuthentificationApi());

  var datauser = UsersViewModel(eventsRepository: UsersApi());

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
                isLogin
                    ? Column(
                        children: [
                          SvgPicture.asset(
                            splashScreen1,
                            height: getProportionateScreenHeight(50),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          SvgPicture.asset(
                            splashScreen2,
                            height: getProportionateScreenHeight(15),
                          ),
                        ],
                      )
                    : const SizedBox(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(15)),
                          child: TextAirbnbCereal(
                            title: isLogin ? 'Se connecter' : "S'inscrire",
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),

                !isLogin
                    ? Padding(
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
                      )
                    : const SizedBox(),
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
                PasswordField(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                !isLogin
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(15)),
                        child: StatefulBuilder(builder: (BuildContext context,
                            void Function(void Function()) setState) {
                          return TextFormField(
                            // password1
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 255, 0, 208)),
                              ),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  borderSide: BorderSide(
                                    width: 1,
                                  )),
                              labelText: "labelText",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(15),
                                child: SvgPicture.asset(lockicon),
                              ),
                              labelStyle: const TextStyle(
                                color: Colors.grey, //<-- SEE HERE
                              ),
                              hintText: "hintText",
                              suffixIcon: IconButton(
                                icon: _obscureText
                                    ? SvgPicture.asset(
                                        hiddenicon,
                                        height: 24,
                                        width: 24,
                                      )
                                    : SvgPicture.asset(
                                        hiddeniconoff,
                                        height: 24,
                                        width: 24,
                                      ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
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
                          );
                        }),
                      )
                    : const SizedBox(),
                isLogin
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CupertinoSwitch(
                                  activeColor: const Color(0xFFFC2207C),
                                  thumbColor:
                                      const Color.fromRGBO(255, 255, 255, 1),
                                  trackColor: Colors.black12,
                                  value: isSwitched,
                                  onChanged: (value) =>
                                      setState(() => isSwitched = value),
                                ),
                                Text(
                                  "Se rappeler",
                                  style: GoogleFonts.lato(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),

                            //authentification
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Mot de passe oublié",
                                style: GoogleFonts.lato(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    color:
                                        const Color.fromRGBO(194, 32, 124, 1)),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                InkWell(
                    onTap: isLogin ? login : register,
                    child: Button(
                      text: isLogin ? "SE CONNECTER" : "S'INSCRIRE",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isLogin
                          ? " Vous n'avez pas un compte ?"
                          : "Vous avez déjà un compte?",
                      style: GoogleFonts.lato(
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                      ),
                    ), //authentification
                    InkWell(
                      onTap: () {
                        setState(() {
                          isLogin = !isLogin;
                        });

                        // navtoRegisterView();
                      },
                      child: Text(
                        isLogin ? " S'inscrire" : "Signin",
                        style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: const Color.fromRGBO(194, 32, 124, 1)),
                      ),
                    ),
                  ],
                ),
                // SinscrireRow(
                //   navtoRegisterView: navtoRegisterView,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  register() {
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
  }

  login() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

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
        final prefs = await SharedPreferences.getInstance();

        if (isSwitched) {
          prefs.setBool("isLoggedIn", true);
        }

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainHomePage(),
            ));
      }
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Padding PasswordField() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: TextFormField(
        keyboardType: TextInputType.text,
        // controller: _userPasswordController,
        obscureText: _obscureText,

        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide:
                BorderSide(width: 1, color: Color.fromARGB(255, 255, 0, 208)),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                width: 1,
              )),
          labelText: "Mot de passe",
          prefixIcon: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(lockicon),
          ),
          labelStyle: const TextStyle(
            color: Colors.grey, //<-- SEE HERE
          ),
          hintText: "entre le password",
          suffixIcon: IconButton(
            icon: _obscureText
                ? SvgPicture.asset(
                    hiddenicon,
                    height: 24,
                    width: 24,
                  )
                : SvgPicture.asset(
                    hiddeniconoff,
                    height: 24,
                    width: 24,
                  ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),

        validator: (value) {
          String pattern = patternstring;
          RegExp regex = RegExp(pattern);

          if (value == null || value.isEmpty || !regex.hasMatch(value)) {
            return "Enter a valid mot de pass";
          } else {
            return null;
          }
        },
        onChanged: (text) {
          passwordfield = text;
        },
      ),
    );
  }
}
