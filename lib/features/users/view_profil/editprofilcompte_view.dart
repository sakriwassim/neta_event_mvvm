import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/colors.dart';
import '../../../core/decoration.dart';
import '../../../core/int.dart';
import '../../../core/string.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../main.dart';
import '../models_users/add_event_model.dart';
import '../models_users/event_model.dart';
import '../view_model_events/users_view_model.dart';

class EditCompte extends StatefulWidget {
  UserModel? userModel;
  EditCompte({required this.userModel, super.key});

  @override
  State<EditCompte> createState() => _EditCompteState();
}

class _EditCompteState extends State<EditCompte> {
  final formkey = GlobalKey<FormState>();
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;
  late String phonefield;
  late String adressefield;
  late String ancienpasswordfield;
  late String nouveaupasswordfield;
  late String confirmerpasswordfield;
  bool _obscureText = false;
  String? imagepath;

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
                  child: TextFormField(
                    decoration: textFieldDecorationWithicon(
                      "entre le ",
                      "Sanogo Yaya",
                      Colors.grey,
                      Profile,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "entre le nom_complet";
                      } else {
                        // libellefield = widget.eventObj.libelle;
                        return null;
                      }
                    },
                    onChanged: (text) {
                      nomcompletfield = text;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                     decoration: textFieldDecorationWithicon(
                      "entre le email",
                      "Adresse e-mail",
                      Colors.grey,
                      message,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "entre le email";
                      } else {
                        // prixfield = widget.eventObj.prix;
                        return null;
                      }
                    },
                    onChanged: (text) {
                      emailfield = text;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    decoration: textFieldDecorationWithicon(
                      "entre le phone nbr",
                      "phone nbr",
                      Colors.grey,
                      Chat,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "entre le phone nbr";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (text) {
                      phonefield = text;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
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
                          "nom_complet": "nomcompletfield",
                          "email": widget.userModel?.email,
                          "telephone": int.parse(phonefield),
                          "adresse": adressefield,
                          "image": widget.userModel?.image.toString(),
                          "password": widget.userModel?.password.toString()
                        };

                        AddUserModel eventformJson =
                            AddUserModel.fromJson(event);

                        setState(() {
                          provider.UpdateUserByID(
                              eventformJson, "${widget.userModel?.id}");
                        });
                        if (provider.isBack == true) {
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
