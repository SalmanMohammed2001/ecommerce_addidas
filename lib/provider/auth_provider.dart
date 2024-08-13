import 'package:ecommerce_addidas/model/user_model.dart';
import 'package:ecommerce_addidas/provider/profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:rename/platform_file_editors/abs_platform_file_editor.dart';

import '../controller/auth_controller.dart';
import '../model/SneakerModel.dart';

class AuthProviders extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  UserModel? _userModel;
  UserModel? get userModel =>  _userModel;

  List<String> _favID=[];
  List<String> get favId=> _favID;

  AuthController authController=AuthController();

  List<SneakerModel> _favItems=[];
  List<SneakerModel> get favItems=> _favItems;




  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void setUserModel(UserModel model,BuildContext context,String name) {
    _userModel = model;
    _favID=model.favId;
    Provider.of<ProfileProvider>(context,listen: false).setUserName(name);
    notifyListeners();
  }

  void updateImage(String url){
    _userModel!.image=url;
    notifyListeners();
  }

  void addToFav(SneakerModel model){
    _favID.add(model.id);
    _favItems.add(model);
    authController.updateFavorite(user!.uid, _favID);
    notifyListeners();
  }


  void removeFromFav(SneakerModel model){
    _favID.remove(model.id);
    _favItems.remove(model);
    authController.updateFavorite(user!.uid, _favID);
    notifyListeners();
  }

  void filterFavouriteItems(List<SneakerModel> sneakers) {
    List<SneakerModel> favSneakers=[];
    for (var item in sneakers) {
        if(_favID.contains(item.id) &&  !_favItems.contains(item)){
          favSneakers.add(item);
        }
    }
    _favItems=favSneakers;
    notifyListeners();
  }


}
