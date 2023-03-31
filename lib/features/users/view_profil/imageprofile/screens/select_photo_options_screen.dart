import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neta_event_mvvm/core/int.dart';

import '../../widget/card_widget_edit_profile.dart';
import '../widgets/re_usable_select_photo_button.dart';

class SelectPhotoOptionsScreen extends StatelessWidget {
  final Function(ImageSource source) onTap;
  const SelectPhotoOptionsScreen({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey.shade300,
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            child: Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(children: [
            CardWidgetEditprofile(
              onTap: () => onTap(ImageSource.gallery),
              icon: Icon(
                Icons.image,
                color: Color.fromARGB(255, 175, 76, 150),
                size: 30.0,
              ),
              text: 'Browse Gallery',
              height: heightbigbutton,
              width: widthbigbutton,
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text(
                'OR',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CardWidgetEditprofile(
              onTap: () => onTap(ImageSource.camera),
              icon: Icon(
                Icons.camera_alt_outlined,
                color: Color.fromARGB(255, 175, 76, 150),
                size: 30.0,
              ),
              text: 'Use a Camera',
              height: heightbigbutton,
              width: widthbigbutton,
            ),
          ])
        ],
      ),
    );
  }
}
