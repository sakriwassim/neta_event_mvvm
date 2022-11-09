class ImageModel {
  String? accountId;
  String? filePath;
  String? fileUrl;

  ImageModel({this.accountId, this.filePath, this.fileUrl});

  ImageModel.fromJson(Map<String, dynamic> json) {
    accountId = json['accountId'];
    filePath = json['filePath'];
    fileUrl = json['fileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountId'] = this.accountId;
    data['filePath'] = this.filePath;
    data['fileUrl'] = this.fileUrl;
    return data;
  }
}
