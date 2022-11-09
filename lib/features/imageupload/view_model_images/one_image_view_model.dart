import '../models_image/image_model.dart';

class OneImageViewModel {
  ImageModel? imageModel;
  OneImageViewModel(this.imageModel);

  get accountId => imageModel?.accountId;
  get filePath => imageModel?.filePath;
  get fileUrl => imageModel?.fileUrl;
}
