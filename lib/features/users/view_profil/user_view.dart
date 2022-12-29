// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:neta_event_mvvm/core/widgets/circle_image.dart';
import 'package:neta_event_mvvm/features/users/view_profil/widget/head_widget.dart';
import 'package:neta_event_mvvm/features/users/view_profil/widget/tab_bar.dart';

import '../../../core/colors.dart';
import '../../../core/decoration.dart';
import '../../../core/int.dart';
import '../../../core/string.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../../imageupload/images_repositories/images_api.dart';
import '../../imageupload/view_model_images/images_view_model.dart';
import '../evants_repositories/events_api.dart';
import '../models_events/add_event_model.dart';
import '../view_model_events/events_view_model.dart';
import '../view_model_events/one_event_view_model.dart';
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

  var data = UsersViewModel(eventsRepository: UsersApi());
  var dataimage = ImagesViewModel(imagesRepository: ImagesApi());

//***********************************/
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList;
  dynamic _pickImageError;
  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
      );
      imagepath = await dataimage.addImage(pickedFile);
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
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
        child: FutureBuilder<OneUserViewModel>(
          future: data.GetUserConnected(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      HeadWidget(
                        title: snapshot.data!.nom_complet,
                        image: snapshot.data!.image,
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
                                      if (formkey.currentState!.validate()) {
                                        var event = {
                                          "role_id": int.parse(
                                              '${snapshot.data!.role_id}'), //1,
                                          "packs_id": int.parse(
                                              '${snapshot.data!.packs_id}'),
                                          "nom_complet": nomcompletfield,
                                          "email": emailfield,
                                          "telephone": int.parse(phonefield),
                                          "adresse": adressefield,
                                          "image":
                                              snapshot.data!.image.toString(),
                                          "password":
                                              snapshot.data!.password.toString()
                                        };

                                        AddUserModel eventformJson =
                                            AddUserModel.fromJson(event);

                                        setState(() {
                                          data.UpdateUserByID(eventformJson);
                                        });
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
                                        top: 20,
                                        bottom: 20,
                                        right: 10,
                                        left: 10),
                                    child: InkWell(
                                      onTap: () async {
                                        await _onImageButtonPressed(
                                            ImageSource.camera,
                                            context: context);
                                        if (formkey.currentState!.validate()) {
                                          var event = {
                                            "role_id": int.parse(
                                                '${snapshot.data!.role_id}'), //1,
                                            "packs_id": int.parse(
                                                '${snapshot.data!.packs_id}'),
                                            "nom_complet": snapshot
                                                .data!.nom_complet
                                                .toString(),
                                            "email":
                                                snapshot.data!.email.toString(),
                                            "telephone": int.parse(
                                                '${snapshot.data!.telephone}'),
                                            "adresse": snapshot.data!.adresse
                                                .toString(),
                                            "image": imagepath,
                                            "password": snapshot.data!.password
                                                .toString()
                                          };

                                          AddUserModel eventformJson =
                                              AddUserModel.fromJson(event);

                                          setState(() {
                                            data.UpdateUserByID(eventformJson);
                                          });
                                        }
                                      },
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: SvgPicture.asset(
                                              "assets/icon_user/CameraButton.svg")),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                        right: 10,
                                        left: 10),
                                    child: InkWell(
                                      onTap: () async {
                                        await _onImageButtonPressed(
                                            ImageSource.gallery,
                                            context: context);

                                        if (formkey.currentState!.validate()) {
                                          var event = {
                                            "role_id": int.parse(
                                                '${snapshot.data!.role_id}'), //1,
                                            "packs_id": int.parse(
                                                '${snapshot.data!.packs_id}'),
                                            "nom_complet": snapshot
                                                .data!.nom_complet
                                                .toString(),
                                            "email":
                                                snapshot.data!.email.toString(),
                                            "telephone": int.parse(
                                                '${snapshot.data!.telephone}'),
                                            "adresse": snapshot.data!.adresse
                                                .toString(),
                                            "image":
                                                "https://admin.saitech-group.com/api_event/public/Images/$imagepath",
                                            "password": snapshot.data!.password
                                                .toString()
                                          };

                                          AddUserModel eventformJson =
                                              AddUserModel.fromJson(event);

                                          setState(() {
                                            data.UpdateUserByID(eventformJson);
                                          });
                                        }
                                      },
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
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
                                        void Function(void Function())
                                            setState) {
                                      return TextFormField(
                                        obscureText: _obscureText,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 255, 0, 208)),
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
                                        void Function(void Function())
                                            setState) {
                                      return TextFormField(
                                        obscureText: _obscureText,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 255, 0, 208)),
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
                                        void Function(void Function())
                                            setState) {
                                      return TextFormField(
                                        obscureText: _obscureText,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 255, 0, 208)),
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
                                          var event = {
                                            "role_id": int.parse(
                                                '${snapshot.data!.role_id}'), //1,
                                            "packs_id": int.parse(
                                                '${snapshot.data!.packs_id}'),
                                            "nom_complet": snapshot
                                                .data!.nom_complet
                                                .toString(),
                                            "email":
                                                snapshot.data!.email.toString(),
                                            "telephone": int.parse(
                                                '${snapshot.data!.telephone}'),
                                            "adresse": snapshot.data!.adresse
                                                .toString(),
                                            "image":
                                                snapshot.data!.image.toString(),
                                            "password": confirmerpasswordfield
                                                .toString()
                                          };

                                          AddUserModel eventformJson =
                                              AddUserModel.fromJson(event);

                                          setState(() {
                                            data.UpdateUserByID(eventformJson);
                                          });

                                          _imageFileList = null;
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
                                            Color.fromARGB(255, 255, 255, 255),
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
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          }),
        ),
      ),
    );
  }
}
