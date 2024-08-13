import 'package:ecommerce_addidas/controller/product_controller.dart';
import 'package:ecommerce_addidas/provider/admin_provider.dart';
import 'package:ecommerce_addidas/provider/auth_provider.dart';
import 'package:ecommerce_addidas/screen/home_screen/cart_page/cart_page.dart';
import 'package:ecommerce_addidas/screen/home_screen/favourite/favourite_page.dart';
import 'package:ecommerce_addidas/screen/home_screen/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../provider/main_screen_provider.dart';
import 'profile/profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  Widget build(BuildContext context) {
    return Consumer3<MainScreenProvider,AuthProviders,AdminProvider>(
      builder: (context,value,auth,admin,child) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.amber,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
              if(index == 1){
                //  auth.filterFavouriteItems(admin.allItems);
               // ProductController().fetchProduct(context);
              }
                value.setCurrentIndex(index);
              },
              currentIndex: value.currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favourite"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: "Cart"),
                BottomNavigationBarItem(icon: Icon(Icons.people), label: "Profile"),
              ]),
          body: value.screen
        );
      }
    );
  }
}
