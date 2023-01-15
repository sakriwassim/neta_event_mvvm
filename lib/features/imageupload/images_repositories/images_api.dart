import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:neta_event_mvvm/core/string.dart';

import 'image_repository.dart';

class ImagesApi extends ImagesRepository {
  @override
  Future<String> addImage(XFile? pickedFile) async {
    String filepath = pickedFile!.path;

    String link = '$baseUrl/Upload';
    var uri = Uri.parse(link);
    var request = http.MultipartRequest('POST', uri);

    var TOKEN =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9mcm96ZW4tcmVmdWdlLTgwOTY1Lmhlcm9rdWFwcC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjY0NTUwNTIzLCJleHAiOjE2NjQ1NTQxMjMsIm5iZiI6MTY2NDU1MDUyMywianRpIjoiSTV2RENLb3NnUVVhWHo2bCIsInN1YiI6MywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjMsImVtYWlsIjoid2Fzc2ltbEBlbWFpbC5jb20ifQ.JrZwVjPqWU_TZ4YrylOtcyMzQg-XoGYcV7hE9fHLGc";

    request.files.add(await http.MultipartFile.fromPath("image", filepath));
    request.headers.addAll({
      'Content-type': 'multipart/form-data',
      'authorization': 'Bearer ' '$TOKEN',
    });

    var response = await request.send();
    //var result = response.body;

    final respStr = await response.stream.bytesToString();
    print("*****************hatha il resonse **************$respStr");
    return respStr;
  }
}
