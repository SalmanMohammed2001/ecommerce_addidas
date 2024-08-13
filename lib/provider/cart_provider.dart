import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier{

  int _quantity =1;

  int get quantity=>_quantity;

  void incrementQuantity(){
    _quantity++;
    notifyListeners();
  }

  void decrementQuantity(){
    if(_quantity !=1){
      _quantity--;
    }

    notifyListeners();
  }
}
