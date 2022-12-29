import 'package:image_picker/image_picker.dart';

import '../models_image/image_model.dart';

abstract class ImagesRepository {
  Future<String> addImage(XFile? pickedFile);
}
