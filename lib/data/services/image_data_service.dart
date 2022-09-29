import 'dart:convert';
import 'package:build_6_wallpaper_app/data/models/image_data_model.dart';
import 'package:http/http.dart' as http;

class ImageDataServices {
  Future<List<ImageDataModel>> getImages(int pageNumber) async {
    List<ImageDataModel> images = [];

    String link =
        'https://jsonplaceholder.typicode.com/photos?_page=$pageNumber&_limit=5';

    try {
      Uri url = Uri.parse(link);
      final response = await http.get(url);
      List<dynamic> data = jsonDecode(response.body);
      for (var data in data) {
        ImageDataModel img = ImageDataModel.fromJson(data);
        images.add(img);
      }
      return images;
    } catch (error) {
      return images;
    }
  }
}
