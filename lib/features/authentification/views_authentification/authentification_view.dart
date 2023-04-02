import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/core/size_config.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/select_company_view.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/colors.dart';
import '../../../core/string.dart';
import '../../../core/widgets/card_google_widget.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../../home/bottom_navigation_bar.dart';
import '../view_model_authentification/authentification_view_model.dart';
import '../widgets/headsigin_widget.dart';
import '../widgets/title_widget.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final formkey = GlobalKey<FormState>();

  final emailfield = TextEditingController();
  final passwordfield = TextEditingController();
  final passwordfieldconfirm = TextEditingController();
  final nomcompletfield = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var provider =
        Provider.of<AuthentificationViewModel>(context, listen: true);

    Widget emailfieldWidget() {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: TextFormField(
          controller: emailfield,
          decoration: textFieldDecorationWithicon(
            "entre le email",
            "Adresse e-mail",
            Colors.grey,
            message,
          ),
          validator: (value) {
            String pattern = pattermail;

            RegExp regex = RegExp(pattern);

            if (value == null || value.isEmpty || !regex.hasMatch(value)) {
              return "Enter a valid email address";
            } else {
              return null;
            }
          },
        ),
      );
    }

    Widget namefieldWidget() {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: TextFormField(
          controller: nomcompletfield,
          decoration: textFieldDecorationWithicon(
            "entre le nom ",
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
        ),
      );
    }

    Widget passwordFieldwidget() {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: TextFormField(
          controller: passwordfield,
          keyboardType: TextInputType.text,
          obscureText: provider.obscureText,
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
              icon: provider.obscureText
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
                provider.setobscureText();
              },
            ),
          ),
          validator: (value) {
            String pattern = patternstring;
            RegExp regex = RegExp(pattern);

            if (value == null || value.isEmpty || !regex.hasMatch(value)) {
              return "lettre minuscule ,lettre majuscule, caractère spécial ,chiffre";
            } else {
              return null;
            }
          },
        ),
      );
    }

    Widget passwordFieldwidgetConfirm() {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: StatefulBuilder(builder:
            (BuildContext context, void Function(void Function()) setState) {
          return TextFormField(
            controller: passwordfieldconfirm,
            // password1
            obscureText: provider.obscureText2,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    width: 1, color: Color.fromARGB(255, 255, 0, 208)),
              ),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    width: 1,
                  )),
              labelText: "Mot de pass",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset(lockicon),
              ),
              labelStyle: const TextStyle(
                color: Colors.grey, //<-- SEE HERE
              ),
              hintText: "hintText",
              suffixIcon: IconButton(
                icon: provider.obscureText2
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
                    provider.obscureText2 = !provider.obscureText2;
                  });
                },
              ),
            ),
            validator: (value) {
              String pattern = patternstring;
              RegExp regex = RegExp(pattern);

              if (value == null || value.isEmpty || !regex.hasMatch(value)) {
                return "vérifier votre mot de passe";
              } else if (passwordfield.text == passwordfieldconfirm.text) {
                return null;
              } else {
                return "vérifier votre mot de passe";
              }
            },
          );
        }),
      );
    }

    comingsoon() {
      showGeneralDialog(
        context: context,
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextAirbnbCereal(
                      color: Color.fromARGB(255, 6, 222, 196), //4F4F4F
                      fontWeight: FontWeight.w500,
                      size: 18,
                      title: "Bientôt Disponible",
                    ),
                    Container(
                      height: 150,
                      child:  Image.asset(coming_soon
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          Tween<Offset> tween;
          if (anim.status == AnimationStatus.reverse) {
            tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
          } else {
            tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
          }

          return SlideTransition(
            position: tween.animate(anim),
            child: FadeTransition(
              opacity: anim,
              child: child,
            ),
          );
        },
      );
    }

    register() {
      if (formkey.currentState!.validate()) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SelectCompany(
                  nomcompletfield: nomcompletfield.text,
                  emailfield: emailfield.text,
                  passwordfield: passwordfield.text),
            ));
      }
    }

    login() async {
      if (formkey.currentState!.validate()) {
        String mail = emailfield.text.trim();
        String password = passwordfield.text.trim();

        await provider.Login(mail, password);

        if (provider.isBack) {
          final prefs = await SharedPreferences.getInstance();

          if (provider.isSwitched) {
            prefs.setBool("isLoggedIn", true);
          }
          //ignore: use_build_context_synchronously
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ));
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                provider.isLogin ? Headsigin() : const SizedBox(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                TitleWidget(
                  isLogin: provider.isLogin,
                ),
                !provider.isLogin ? namefieldWidget() : const SizedBox(),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                emailfieldWidget(),
                const SizedBox(
                  height: 15,
                ),
                passwordFieldwidget(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                !provider.isLogin
                    ? passwordFieldwidgetConfirm()
                    : const SizedBox(),
                provider.isLogin
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
                                  value: provider.isSwitched,
                                  onChanged: (value) =>
                                      provider.setisSwitched(),
                                ),
                                TextAirbnbCereal(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontWeight: FontWeight.w300,
                                  size: 15,
                                  title: "Se rappeler",
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {},
                              child: TextAirbnbCereal(
                                color: Color.fromRGBO(194, 32, 124, 1),
                                fontWeight: FontWeight.w300,
                                size: 15,
                                title: "Mot de passe oublié",
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                provider.message != ""
                    ? SizedBox(
                        height: 40,
                        child: Center(
                          child: TextAirbnbCereal(
                            color: Color.fromRGBO(194, 32, 124, 1),
                            fontWeight: FontWeight.w300,
                            size: 15,
                            title: provider.message,
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 20,
                      ),
                InkWell(
                    onTap: provider.isLogin ? login : register,
                    child: Button(
                      text: provider.isLogin ? "SE CONNECTER" : "S'INSCRIRE",
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
                  onTap: () {
                    comingsoon();
                  },
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
                  onTap: () {
                    comingsoon();
                  },
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
                    TextAirbnbCereal(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      size: 15,
                      title: provider.isLogin
                          ? " Vous n'avez pas un compte ?"
                          : "Vous avez déjà un compte?",
                    ),
                    InkWell(
                      onTap: () {
                        provider.setisLogin();
                      },
                      child: TextAirbnbCereal(
                        color: Color.fromRGBO(194, 32, 124, 1),
                        fontWeight: FontWeight.w300,
                        size: 15,
                        title: provider.isLogin ? " S'inscrire" : " Signin",
                      ),
                    ),
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
