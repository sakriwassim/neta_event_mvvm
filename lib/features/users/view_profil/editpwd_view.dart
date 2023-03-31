import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/string.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../main.dart';
import '../models_users/add_event_model.dart';
import '../models_users/event_model.dart';
import '../view_model_events/users_view_model.dart';

class EditPwd extends StatefulWidget {
  UserModel? userModel;
  EditPwd({required this.userModel, super.key});

  @override
  State<EditPwd> createState() => _EditPwdState();
}

class _EditPwdState extends State<EditPwd> {
  final formkey = GlobalKey<FormState>();
  late String ancienpasswordfield;
  late String nouveaupasswordfield;
  late String confirmerpasswordfield;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    Provider.of<UsersViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UsersViewModel>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          shadowColor: Colors.white,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            "Profile Edit ",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: StatefulBuilder(
                    builder: (BuildContext context,
                        void Function(void Function()) setState) {
                      return TextFormField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
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
                          if (value!.isEmpty) {
                            return "entre le ancien password";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (text) {
                          ancienpasswordfield = text;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: StatefulBuilder(
                    builder: (BuildContext context,
                        void Function(void Function()) setState) {
                      return TextFormField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
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
                          if (value!.isEmpty) {
                            return "entre le nouveau password";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (text) {
                          nouveaupasswordfield = text;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: StatefulBuilder(
                    builder: (BuildContext context,
                        void Function(void Function()) setState) {
                      return TextFormField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
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
                          if (value!.isEmpty) {
                            return "entre le password";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (text) {
                          confirmerpasswordfield = text;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            });
                        var event = {
                          "role_id":
                              int.parse('${widget.userModel?.roleId}'), //1,
                          "packs_id": int.parse('${widget.userModel?.packsId}'),
                          "nom_complet":
                              widget.userModel?.nomComplet.toString(),
                          "email": widget.userModel?.email.toString(),
                          "telephone":
                              int.parse('${widget.userModel?.telephone}'),
                          "adresse": widget.userModel?.adresse.toString(),
                          "image": widget.userModel?.image.toString(),
                          "password": confirmerpasswordfield.toString()
                        };

                        AddUserModel eventformJson =
                            AddUserModel.fromJson(event);

                        setState(() {
                          provider.UpdateUserByID(
                              eventformJson, "${widget.userModel?.id}");
                        });
                        if (provider.isBack = true) {
                          print("profile updated");

                          navigatorKey.currentState!
                              .popUntil((route) => route.isFirst);
                        }
                      }
                    },
                    child: Button(
                      fontWeight: FontWeight.normal,
                      text: "APPLIQUER",
                      fontSize: fontSizemediumbutton,
                      gradientbackground: gradientbackground,
                      height: heightmediumbutton,
                      width: widthmediumbutton,
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
