import 'package:ecommerce_addidas/model/SneakerModel.dart';
import 'package:ecommerce_addidas/screen/home_screen/cart_page/cart_page.dart';
import 'package:ecommerce_addidas/utils/CustomNavigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../model/cart_item_model.dart';

class CartProvider extends ChangeNotifier {
  int _quantity = 1;

  int get quantity => _quantity;

  void incrementQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (_quantity != 1) {
      _quantity--;
    }
    notifyListeners();
  }

  List<CartItemModel> _cartItem = [];

  List<CartItemModel> get cartItem => _cartItem;

  void addToCart(SneakerModel model,BuildContext context) {
    if (_cartItem.any((element) => element.model.id == model.id)) {
      _cartItem.removeWhere((element) => element.model.id == model.id);
      Logger().e(_cartItem.length);
      notifyListeners();

    } else {
      _cartItem.add(CartItemModel(model: model, quantity: _quantity));
      Logger().f(_cartItem.length);
      CustomNavigator.goTo(context, CartPage());
      notifyListeners();
    }
  }
  void  increaseCartItemQuantity(int index){
    _cartItem[index].quantity ++;
    notifyListeners();
  }
  void  decreaseCartItemQuantity(int index){
    if(_cartItem[index].quantity !=1){
      _cartItem[index].quantity --;
      notifyListeners();
    }
  }
  String getQuantity(SneakerModel model){
      int q=1;
    if(_cartItem.any((element) => element.model.id == model.id)){
      q=_cartItem[_cartItem.indexWhere((element) => element.model.id == model.id)].quantity;
    }else{
      q=quantity;
    }
    return "$q";
  }

  String calculateTotal(){
    double total=0;
    for(var element in _cartItem){
      total+=element.model.price * element.quantity;

    }
return "$total";
  }

}

