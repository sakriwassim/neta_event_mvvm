import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../models_image/image_model.dart';
import 'image_repository.dart';

class ImagesApi extends ImagesRepository {
  @override
  Future<ImageModel> addImage(XFile? pickedFile) async {
    // void upload(XFile? pickedFile) async {
    //if (pickedFile == null) return;
    String filepath = pickedFile!.path;
    //final base64 = base64Encode(File(filepath).readAsBytesSync());
    //final nbrbase64 = await File(filepath).readAsBytes();

    //String imagename = filepath.split("/").last;

    String link = 'https://api.upload.io/v2/accounts/W142hWB/uploads/binary';
    var uri = Uri.parse(link);
    var request = http.MultipartRequest('POST', Uri.parse(link));

    Map<String, String> headers = {
      'Authorization': 'Bearer public_W142hWB9R6pZYzL7AtsoEjDRLPqa',
      'Content-Type': 'image/jpeg',
    };
    http.Response response = await post(uri,
        headers: headers, body: File(filepath).readAsBytesSync());
    var responsebody = jsonEncode(response.body);
    print(responsebody);

    ImageModel.fromJson(json.decode(response.body));
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    return imageModel;
  }
}
