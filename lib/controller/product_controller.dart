import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_addidas/model/SneakerModel.dart';
import 'package:ecommerce_addidas/provider/admin_provider.dart';
import 'package:ecommerce_addidas/provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ProductController{

  CollectionReference products=FirebaseFirestore.instance.collection("Products");

  Future<void> addProduct(SneakerModel model,CollectionReference products,String docId,BuildContext context)async{
    try {
      await products.doc(docId).set(model.toJson()).then((value) {
        Logger().f("Product Saved");
        Provider.of<AdminProvider>(context,listen: false).clearForm();
      },);

    } catch (e) {
      Logger().e(e);
    }
  }

  Future<List<SneakerModel>> fetchProduct(context)async{
    try{
       QuerySnapshot snapshot= await products.get();
       if(snapshot.docs.isEmpty){
         Logger().e("Cant fetch data");
         return [];
       }else{
         List<SneakerModel> sneakers=[];
         for(var element in snapshot.docs){
           SneakerModel  sneaker =SneakerModel.fromJson(element.data()as Map<String,dynamic>);
           sneakers.add(sneaker);

         }
       Provider.of<AuthProviders>(context,listen: false).filterFavouriteItems(sneakers);
         Provider.of<AdminProvider>(context,listen: false).setAllProduct(sneakers);
         return sneakers;
       }

    }catch(e){

      Logger().e(e);
      return [];
    }
  }

}
