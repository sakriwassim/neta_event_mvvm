import 'package:image_picker/image_picker.dart';

import '../images_repositories/image_repository.dart';
import '../models_image/image_model.dart';
import 'one_image_view_model.dart';

class ImagesViewModel {
  String title = "Event Page ";

  ImagesRepository? imagesRepository;
  ImagesViewModel({this.imagesRepository});

  Future<String?> addImage(XFile? pickedFile) async {
    var imageurl = await imagesRepository!.addImage(pickedFile);

    print("**************imagenammeee************$imageurl");
    return imageurl;
  }
}
