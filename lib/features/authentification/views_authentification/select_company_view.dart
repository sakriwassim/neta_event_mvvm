import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/features/authentification/models_authentification/response_model.dart';
import '../../../core/colors.dart';
import '../../../core/size_config.dart';
import '../../../core/string.dart';
import '../../../core/widgets/select_button.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../authentification_repositories/authentification_api.dart';
import '../view_model_authentification/authentification_view_model.dart';
import 'authentification_view.dart';

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

  // var data = AuthentificationViewModel(
  //     authentificationRepository: AuthentificationApi());

  navtoRegisterView() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthView(),
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
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                                child: CircularProgressIndicator());
                          });

                      // RegisterResponseModel verif = await data.Register(
                      //     selectIndex,
                      //     widget.nomcompletfield,
                      //     widget.emailfield,
                      //     widget.passwordfield);

                      // if (verif.code == 200) {
                      //   //Navigator.pop(context);
                      //   navtoRegisterView();
                      // }

                      // navigatorKey.currentState!
                      //     .popUntil((route) => route.isFirst);
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
