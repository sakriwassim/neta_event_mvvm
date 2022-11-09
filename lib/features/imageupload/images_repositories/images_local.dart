import 'package:image_picker/image_picker.dart';

import '../models_image/image_model.dart';
import 'image_repository.dart';

class ImagesLocal extends ImagesRepository {
  @override
  Future<ImageModel> addImage(XFile? pickedFile) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
