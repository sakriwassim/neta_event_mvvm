import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/features/authentification/models_authentification/response_model.dart';
import 'package:provider/provider.dart';
import '../../../core/colors.dart';
import '../../../core/size_config.dart';
import '../../../core/string.dart';
import '../../../core/widgets/select_button.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../view_model_authentification/authentification_view_model.dart';
import 'authentification_view.dart';

class SelectCompany extends StatelessWidget {
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;
  final formkey = GlobalKey<FormState>();

   SelectCompany ({Key? key ,
     required this.nomcompletfield,
     required this.emailfield,
     required this.passwordfield
   }) : super(key: key);


  late int valueselected = 1;
  bool buttonselected = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    AuthentificationViewModel provider =
        Provider.of<AuthentificationViewModel>(context, listen: true);

    navtoRegisterView() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AuthView(),
          ));
    }

    register() async {
      await provider.Register(
          provider.selectIndex, nomcompletfield, emailfield, passwordfield);

      if (provider.isBack) {
        provider.isLogin;
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AuthView(),
            ));
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Alert Dialog"),
              content: Text(provider.message),
              actions: [
                TextButton(
                  child: const Text("Close"),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthView(),
                        ));
                  },
                )
              ],
            );
          },
        );
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => navtoRegisterView(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(15)),
                        child: SvgPicture.asset(Back),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
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
                        provider.setisIndex(index);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(10)),
                        child: SelectButton(
                          isSelected: provider.selectIndex == index
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
                    onTap: () {
                      register();
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
