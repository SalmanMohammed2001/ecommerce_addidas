import 'package:flutter/material.dart';

import '../screen/home_screen/cart_page/cart_page.dart';
import '../screen/home_screen/favourite/favourite_page.dart';
import '../screen/home_screen/home_page/home_page.dart';
import '../screen/home_screen/profile/profile_page.dart';

class MainScreenProvider extends ChangeNotifier{
  int _currentIndex=0;

  int get currentIndex => _currentIndex;
  List<Widget> _screens = [
    const HomePage(),
    const FavouritePage(),
    const CartPage(),
    const ProfilePage()
  ];

  Widget get screen => _screens[currentIndex];

  void setCurrentIndex(index){
    _currentIndex =index;
    notifyListeners();
  }


}
