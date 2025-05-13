import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/profile/user.dart';
import 'package:image_picker/image_picker.dart';

class UserModel extends ChangeNotifier {
  ImagePicker imagePicker = ImagePicker();
  User? _user;
  User? get user => _user;

  Future<void> imageSelector(ImageSource source) async {
    XFile? image = await imagePicker.pickImage(source: source);

    if (image != null) {
      if (_user != null) {
        _user!.image = File(image.path);
      } else {
        _user = User(
          name: "kahled",
          bio: "ddjfhfhjfd",
          image: File(image.path),
        );
      }
      notifyListeners();
    }
  }

  void removeImage() {
    if (_user != null) {
      _user!.image = null;
      notifyListeners();
    }
  }
}
