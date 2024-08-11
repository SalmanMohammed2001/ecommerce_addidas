import 'dart:io';

import 'package:ecommerce_addidas/controller/auth_controller.dart';
import 'package:ecommerce_addidas/controller/storage_controller.dart';
import 'package:ecommerce_addidas/provider/auth_provider.dart';
import 'package:ecommerce_addidas/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ProfileProvider extends ChangeNotifier {
  AuthController authController = AuthController();
  FileImagePicker fileImagePicker = FileImagePicker();
  StorageController storageController = StorageController();

  TextEditingController _nameController = TextEditingController();

  TextEditingController get nameController => _nameController;

  File? _pickImage;

  File? get pickImage => _pickImage;

  void setUserName(String name) {
    _nameController.text = name;
    notifyListeners();
  }

  Future<void> updateUserData(BuildContext context) async {
    final auth = Provider.of<AuthProviders>(context, listen: false);

    if (_pickImage != null) {
      String url = await storageController.uploadImage(
          "User Image", "${auth.user!.uid}.jpg", _pickImage!);
      Logger().f(url);

      if (url != "") {
        auth.updateImage(url);
      }
    }

    if (_nameController.text.trim().isNotEmpty) {
      Map<String, dynamic> data = {
        "name": _nameController.text,
        "image": auth.userModel!.image
      };
      authController.updateUser(data, auth.user!.uid);
    } else {
      Logger().e("Please enter Your Name");
    }
  }

  Future<void> pickProfileImage(BuildContext context) async {
    try {
      _pickImage = await fileImagePicker.pickImage(context);
      notifyListeners();
    } catch (e) {
      Logger().e(e);
    }
  }
}
