import 'package:flutter/material.dart';

class SelectionImageProvider extends ChangeNotifier {
  List<String?> _imageFiles = [];
  List<bool> _selection = [];

  List<String?> get imageFiles => _imageFiles;
  List<bool> get selection => _selection;

  void setProvider(List<String?> images) {
    _imageFiles = images;
    _selection = List<bool>.generate(images.length, (index) => true);
    notifyListeners();
  }

  void selectImage(int index) {
    _selection[index] = !_selection[index];
    notifyListeners();
  }
}
