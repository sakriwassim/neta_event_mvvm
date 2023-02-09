import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../images_repositories/images_api.dart';

class ImagesViewModel extends ChangeNotifier {
  String title = "Event Page ";
  String? imagepath;
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList;
  dynamic _pickImageError;

  Future<void> addImage(XFile? pickedFile) async {
    var imageurl = await ImagesApi().addImage(pickedFile);
    notifyListeners();
    print("**************imagenammeee************$imageurl");
  }

  Future<void> onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
      );

      imagepath = await ImagesApi().addImage(pickedFile);
      notifyListeners();
    } catch (e) {
      _pickImageError = e;
      notifyListeners();
    }
  }
}
