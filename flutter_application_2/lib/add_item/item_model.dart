import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/add_item/item.dart';
import 'package:image_picker/image_picker.dart';

class ItemModel extends ChangeNotifier {
  final List<Item> _items = [];
  List<Item> get Items => _items;
  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  ImagePicker imagePicker = ImagePicker();
  List<File>? selectedImage = [];

  Future<void> imageSelector() async {
    List<XFile>? images = await imagePicker.pickMultiImage();

    if (images != null) {
      selectedImage!.addAll(
        images.map((toElement) => File(toElement!.path)).toList(),
      );

    }
    notifyListeners();
  }

  void removeImage(index) {
    selectedImage!.removeAt(index);

    notifyListeners();
  }

  Item? _selectedItem;
  Item? get selectedItem => _selectedItem;
  selectItems(Item item) {
    _selectedItem = item;
    notifyListeners();
  }

  void toggleFavorite(int index) {}
}
