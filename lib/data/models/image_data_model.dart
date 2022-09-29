class ImageDataModel {
  final int id;
  final String url;

  ImageDataModel({required this.id, required this.url});

  ImageDataModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        url = json['url'];
}
