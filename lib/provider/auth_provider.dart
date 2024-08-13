import 'package:ecommerce_addidas/model/user_model.dart';
import 'package:ecommerce_addidas/provider/profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../controller/auth_controller.dart';

class AuthProviders extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  UserModel? _userModel;
  UserModel? get userModel =>  _userModel;

  List<String> _favID=[];
  List<String> get favId=> _favID;

  AuthController authController=AuthController();


  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void setUserModel(UserModel model,BuildContext context,String name) {
    _userModel = model;
    Provider.of<ProfileProvider>(context,listen: false).setUserName(name);
    notifyListeners();
  }

  void updateImage(String url){
    _userModel!.image=url;
    notifyListeners();
  }

  void addToFav(String id){
    _favID.add(id);
    authController.updateFavorite(user!.uid, _favID);
    notifyListeners();
  }


  void removeFromFav(String id){
    _favID.remove(id);
    authController.updateFavorite(user!.uid, _favID);
    notifyListeners();
  }

}
