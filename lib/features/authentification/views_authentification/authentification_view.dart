import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/core/size_config.dart';
import 'package:neta_event_mvvm/features/authentification/views_authentification/select_company_view.dart';
import 'package:neta_event_mvvm/features/users/evants_repositories/events_api.dart';
import 'package:neta_event_mvvm/features/users/view_model_events/events_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/colors.dart';
import '../../../core/string.dart';
import '../../../core/widgets/card_google_widget.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';

import '../view_model_authentification/authentification_view_model.dart';

class AuthView extends StatelessWidget {
  AuthView({super.key});

  final formkey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool _obscureText2 = true;
  bool isSwitched = true;
  bool isLogin = true;

  final emailfield = TextEditingController();
  final passwordfield = TextEditingController();
  final passwordfieldconfirm = TextEditingController();
  final nomcompletfield = TextEditingController();

  AuthentificationViewModel? authentificationViewModel;
  var datauser = UsersViewModel(eventsRepository: UsersApi());

  Widget headsigin() {
    return Column(
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
    );
  }

  Widget titleWidget() {
    return Column(
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
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
      ],
    );
  }

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
          obscureText: _obscureText2,
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
            labelText: "passsssseord",
            prefixIcon: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(lockicon),
            ),
            labelStyle: const TextStyle(
              color: Colors.grey, //<-- SEE HERE
            ),
            hintText: "hintText",
            suffixIcon: IconButton(
              icon: _obscureText2
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
                  _obscureText2 = !_obscureText2;
                });
              },
            ),
          ),
          validator: (value) {
            String pattern = patternstring;
            RegExp regex = RegExp(pattern);

            if (value == null || value.isEmpty || !regex.hasMatch(value)) {
              return "Enter a valid mot de pass";
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

  Widget passwordFieldwidget() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: TextFormField(
        controller: passwordfield,
        keyboardType: TextInputType.text,
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
              // setState(() {
              //   _obscureText = !_obscureText;
              // });
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    AuthentificationViewModel authentificationViewModel =
        Provider.of<AuthentificationViewModel>(context, listen: true);

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
      String mail = emailfield.text.trim();
      String password = passwordfield.text.trim();
      var provider =
          Provider.of<AuthentificationViewModel>(context, listen: false);
      await provider.Login(mail, password);
      if (provider.isBack) {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Container(),
            ));
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
                isLogin ? headsigin() : const SizedBox(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                titleWidget(),
                !isLogin ? namefieldWidget() : const SizedBox(),
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
                !isLogin ? passwordFieldwidgetConfirm() : const SizedBox(),
                isLogin
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // CupertinoSwitch(
                                //   activeColor: const Color(0xFFFC2207C),
                                //   thumbColor:
                                //       const Color.fromRGBO(255, 255, 255, 1),
                                //   trackColor: Colors.black12,
                                //   value: isSwitched,
                                //   onChanged: (value) =>
                                //       setState(() => isSwitched = value),
                                // ),
                                Text(
                                  "Se rappeler",
                                  style: GoogleFonts.lato(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Text(authentificationViewModel.error),

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
                    : const SizedBox(),
                Text(authentificationViewModel.message),
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
                        // setState(() {
                        //   isLogin = !isLogin;
                        // });

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
