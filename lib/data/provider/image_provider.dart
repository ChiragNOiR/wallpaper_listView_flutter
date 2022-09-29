import 'dart:developer';

import 'package:build_6_wallpaper_app/data/models/image_data_model.dart';
import 'package:build_6_wallpaper_app/data/services/image_data_service.dart';
import 'package:flutter/material.dart';

class ImageDataProvider extends ChangeNotifier {
  ImageDataServices imageDataServices = ImageDataServices();

  int page = 1;
  List<ImageDataModel> _images = [];
  bool _isLoadingImage = false;
  bool _isLoadingMoreImage = false;

  List<ImageDataModel> get images => _images;
  bool get isLoadingImage => _isLoadingImage;
  bool get isLoadingMoreImage => _isLoadingMoreImage;

  void loadingImage() async {
    _isLoadingImage = true;
    notifyListeners();
    _images = await imageDataServices.getImages(page);
    _isLoadingImage = false;
    notifyListeners();
  }

  Future loadingMoreImage() async {
    _isLoadingMoreImage = true;
    notifyListeners();
    final img = await imageDataServices.getImages(++page);
    log(_images.length.toString());
    _images.addAll(img);
    _isLoadingMoreImage = false;
    notifyListeners();
    if (img.isEmpty) {
      return false;
    }
    return true;
  }
}
