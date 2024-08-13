import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_addidas/controller/product_controller.dart';
import 'package:ecommerce_addidas/controller/storage_controller.dart';
import 'package:ecommerce_addidas/model/SneakerModel.dart';
import 'package:ecommerce_addidas/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AdminProvider extends ChangeNotifier {
  ProductController productController = ProductController();

  TextEditingController _nameController = TextEditingController();

  TextEditingController get nameController => _nameController;

  TextEditingController _descriptionController = TextEditingController();

  TextEditingController get descriptionController => _descriptionController;

  TextEditingController _priceController = TextEditingController();

  TextEditingController get priceController => _priceController;

  File? _imageFile;

  File? get imageFile => _imageFile;

  CollectionReference products =
      FirebaseFirestore.instance.collection("Products");


  List<SneakerModel> _allItems=[];

  List<SneakerModel> get allItems=>_allItems;

  Future<void> pickImage(BuildContext context) async {
    try {
      _imageFile = await FileImagePicker().pickImage(context);
      notifyListeners();
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<void> addProduct(BuildContext context) async {
    if (_imageFile != null &&
        _nameController.text.trim().isNotEmpty &&
        _descriptionController.text.trim().isNotEmpty &&
        _priceController.text.isNotEmpty) {

      String docId=products.doc().id;

      await StorageController()
          .uploadImage("product Images", "${docId}.jpg", imageFile!)
          .then(
        (value) async {
          if (value == "") {
            Logger().e("Failed");
          } else {
            SneakerModel model = SneakerModel(
                id: docId,
                title: _nameController.text,
                description: _descriptionController.text,
                image: value,
                price: double.parse(_priceController.text));
            await productController.addProduct(model, products,docId,context);
          }
        },
      );
    } else {
      Logger().e("Please add product Details");
    }
  }

  void clearForm(){
    _descriptionController.clear();
    _nameController.clear();
    _priceController.clear();
    _imageFile=null;
    notifyListeners();
  }

  void setAllProduct(List<SneakerModel> list){
    _allItems= list;
    notifyListeners();

  }
}
