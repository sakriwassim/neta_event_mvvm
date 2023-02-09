import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neta_event_mvvm/features/users/view_profil/widget/head_widget.dart';
import 'package:neta_event_mvvm/features/users/view_profil/widget/tab_bar.dart';
import 'package:provider/provider.dart';
import '../../../core/colors.dart';
import '../../../core/decoration.dart';
import '../../../core/int.dart';
import '../../../core/string.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../main.dart';
import '../../imageupload/view_model_images/images_view_model.dart';
import '../models_users/add_event_model.dart';
import '../view_model_events/users_view_model.dart';
import 'widget/column_of_text.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> with TickerProviderStateMixin {
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
    Provider.of<UsersViewModel>(context, listen: false).GetUserConnected();
  }



  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    var provider = Provider.of<UsersViewModel>(context, listen: false);
    var provideruser =
        Provider.of<UsersViewModel>(context, listen: false).userConnected;
    var providerimage = Provider.of<ImagesViewModel>(context, listen: true);

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
                HeadWidget(
                  title: provideruser!.nomComplet!,
                  image: provideruser.image!,
                  heightimage: 100,
                  widthimage: 100,
                ),
                TabBarWidget(tabController: _tabController),
                SizedBox(
                  width: double.maxFinite,
                  height: 500,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
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
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextFormField(
                              //controller: TextEditingController(text: widget.eventObj.prix),
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
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration: textFieldDecorationWithicon(
                                "entre le Address",
                                "Address",
                                Colors.grey,
                                Locationoff,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "entre le Address";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (text) {
                                adressefield = text;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
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
                          InkWell(
                              onTap: () async {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    });

                                if (formkey.currentState!.validate()) {
                                  var event = {
                                    "role_id": int.parse(
                                        '${provideruser.roleId}'), //1,
                                    "packs_id":
                                        int.parse('${provideruser.packsId}'),
                                    "nom_complet": nomcompletfield,
                                    "email": emailfield,
                                    "telephone": int.parse(phonefield),
                                    "adresse": adressefield,
                                    "image": provideruser.image.toString(),
                                    "password": provideruser.password.toString()
                                  };

                                  AddUserModel eventformJson =
                                      AddUserModel.fromJson(event);

                                  setState(() {
                                    provider.UpdateUserByID(eventformJson,
                                        provideruser.id.toString());
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
                      Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 20, right: 10, left: 10),
                              child: InkWell(
                                onTap: () async {
                                   providerimage.onImageButtonPressed(
                                      ImageSource.camera,
                                      context: context);
                                  if (formkey.currentState!.validate()) {
                                    var event = {
                                      "role_id": int.parse(
                                          '${provideruser.roleId}'), //1,
                                      "packs_id":
                                          int.parse('${provideruser.packsId}'),
                                      "nom_complet": provideruser.nomComplet,
                                      "email": provideruser.email,
                                      "telephone": int.parse(
                                          '${provideruser.telephone}'),
                                      "adresse":
                                          provideruser.adresse.toString(),
                                      "image": imagepath,
                                      "password":
                                          provideruser.password.toString()
                                    };

                                    AddUserModel eventformJson =
                                        AddUserModel.fromJson(event);

                                    setState(() {
                                      //   data.UpdateUserByID(eventformJson,provideruser.id);
                                    });
                                  }
                                },
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: SvgPicture.asset(
                                        "assets/icon_user/CameraButton.svg")),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 20, right: 10, left: 10),
                              child: InkWell(
                                onTap: () async {
                                   providerimage.onImageButtonPressed(
                                      ImageSource.gallery,
                                      context: context);

                                  if (formkey.currentState!.validate()) {
                                    var event = {
                                      "role_id": int.parse(
                                          '${provideruser.roleId}'), //1,
                                      "packs_id":
                                          int.parse('${provideruser.packsId}'),
                                      "nom_complet":
                                          provideruser.nomComplet.toString(),
                                      "email": provideruser.email.toString(),
                                      "telephone": int.parse(
                                          '${provideruser.telephone}'),
                                      "adresse":
                                          provideruser.adresse.toString(),
                                      "image":
                                          "https://admin.saitech-group.com/api_event/public/Images/$imagepath",
                                      "password":
                                          provideruser.password.toString()
                                    };

                                    AddUserModel eventformJson =
                                        AddUserModel.fromJson(event);

                                    setState(() {
                                      //  data.UpdateUserByID(eventformJson,provideruser.id);
                                    });
                                  }
                                },
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: SvgPicture.asset(
                                        "assets/icon_user/GalleryButton.svg")),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const ColumnOfTestWidget(),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function()) setState) {
                                return TextFormField(
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromARGB(255, 255, 0, 208)),
                                    ),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
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
                                          print(_obscureText);
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
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function()) setState) {
                                return TextFormField(
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromARGB(255, 255, 0, 208)),
                                    ),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
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
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function()) setState) {
                                return TextFormField(
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromARGB(255, 255, 0, 208)),
                                    ),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
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
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            alignment: Alignment.centerRight,
                            child: InkWell(
                                onTap: () async {
                                  if (formkey.currentState!.validate()) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        });
                                    var event = {
                                      "role_id": int.parse(
                                          '${provideruser.roleId}'), //1,
                                      "packs_id":
                                          int.parse('${provideruser.packsId}'),
                                      "nom_complet":
                                          provideruser.nomComplet.toString(),
                                      "email": provideruser.email.toString(),
                                      "telephone": int.parse(
                                          '${provideruser.telephone}'),
                                      "adresse":
                                          provideruser.adresse.toString(),
                                      "image": provideruser.image.toString(),
                                      "password":
                                          confirmerpasswordfield.toString()
                                    };

                                    AddUserModel eventformJson =
                                        AddUserModel.fromJson(event);

                                    setState(() {
                                      provider.UpdateUserByID(eventformJson,
                                          provideruser.id.toString());
                                    });
                                    if (provider.isBack = false) {
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
                                  textcolor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
