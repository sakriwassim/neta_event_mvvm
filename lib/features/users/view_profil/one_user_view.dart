import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/features/users/view_profil/user_view.dart';
import 'package:provider/provider.dart';
import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/size_config.dart';
import '../../../core/string.dart';
import '../../../core/widgets/image_cached_internet.dart';
import '../../../core/widgets/small_button_style.dart';
import '../view_model_events/users_view_model.dart';

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'imageprofile/screens/select_photo_options_screen.dart';

class OneUserView extends StatefulWidget {
  const OneUserView ({Key? key}) : super(key: key);

  @override
  State<OneUserView> createState() => _OneUserViewState();
}

class _OneUserViewState extends State<OneUserView> {
  final formkey = GlobalKey<FormState>();
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;

  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<UsersViewModel>(context, listen: false).GetUserConnected();
  }

  @override
  Widget build(BuildContext context) {
    var data =
        Provider.of<UsersViewModel>(context, listen: false).userConnected;
    // var imageinternet =
    //     "https://scaffoldtecnologia.com.br/wp-content/uploads/2021/10/app-2.png";

    var imageinternet = data!.image;
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
          title: const Text(
            "Profile",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                //onTap: () => _showSelectPhotoOptions(context),
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200,
                          ),
                          child: Center(
                              child: imageinternet != null &&
                                      imageinternet != ""
                                  ? ImageCachedInternet(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      imageUrl: "$imageinternet",
                                      width: MediaQuery.of(context).size.width,
                                    )
                                  : _image != null
                                      ? CircleAvatar(
                                          radius: 200.0,
                                          backgroundImage: FileImage(_image!))
                                      : const CircleAvatar(
                                          radius: 200.0,
                                          backgroundImage:
                                              AssetImage(nouserimage)))),
                      Positioned(
                          bottom: 0,
                          right: -25,
                          child: RawMaterialButton(
                            onPressed: () {
                              _showSelectPhotoOptions(context);
                            },
                            elevation: 2.0,
                            fillColor: Color(0xFFF5F6F9),
                            child: Icon(
                                _image == null
                                    ? Icons.camera_alt_outlined
                                    : Icons.edit,
                                color: coloricon),
                            padding: EdgeInsets.all(8.0),
                            shape: CircleBorder(),
                          )),
                    ],
                  ),
                ),
              ),

              // SizedBox(
              //   height: getProportionateScreenHeight(150),
              //   width: getProportionateScreenWidth(150),
              //   child: CircleAvatar(
              //     child: ClipOval(
              //       child: ImageCachedInternet(
              //         height: MediaQuery.of(context).size.height,
              //         imageUrl: '${data?.image}',
              //         width: MediaQuery.of(context).size.width,
              //       ),
              //     ),
              //   ),
              // ),

              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Text(
                "${data.nomComplet}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserView(
                            userModel: data,
                          ),
                        ));
                  },
                  child: Button(
                    fontWeight: FontWeight.w500,
                    text: "Edit Profile",
                    fontSize: fontSizemediumbutton,
                    gradientbackground: gradientbackground,
                    height: heightmediumbutton,
                    width: widthmediumbutton,
                    textcolor: Colors.white,
                  )),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50)),
                child: Row(
                  children: [
                    SvgPicture.asset(Profile),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Text(
                      "${data.nomComplet}",
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50)),
                child: Row(
                  children: [
                    SvgPicture.asset(message),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Text(
                      "${data.email}",
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50)),
                child: Row(
                  children: [
                    SvgPicture.asset(Locationoff),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Text(
                      "${data.adresse}",
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50)),
                child: Row(
                  children: [
                    SvgPicture.asset(Chat),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Text(
                      "${data.telephone}",
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
