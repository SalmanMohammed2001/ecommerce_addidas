import 'package:ecommerce_addidas/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_button/custom_button1.dart';
import '../../../model/SneakerModel.dart';
import '../../../utils/DemoData.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouriteState();
}

class _FavouriteState extends State<FavouritePage> {
  List<SneakerModel> sneaker = DemoData.sneakers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Row(
            children: [BackButton(), CustomText(text: "Favorite Items")],
          ),
          Divider(
            color: Colors.grey.shade700,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sneaker.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: const Color(0XFFEBEEF0),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(sneaker[index].image))),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: sneaker[index].title,
                              fontsize: 15,
                            ),
                            Chip(
                              label: Text("LKR ${sneaker[index].price}0"),
                            )
                          ],
                        ),
                        const Spacer(),
                        IconButton(onPressed: () {

                        }, icon: const Icon(Icons.delete,color: Colors.red,)),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
