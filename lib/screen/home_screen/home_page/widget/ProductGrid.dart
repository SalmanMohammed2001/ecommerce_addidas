import 'package:ecommerce_addidas/controller/product_controller.dart';
import 'package:ecommerce_addidas/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../model/SneakerModel.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ProductController().fetchProduct(context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Has Error");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                    highlightColor: Colors.grey.shade500,
                    baseColor: Colors.grey.shade400,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                    ));
              },
            );
          }

          List<SneakerModel> sneaker = snapshot.data!;

          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: sneaker.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(sneaker[index].image),
                      fit: BoxFit.cover),
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
                child:
                    Consumer<AuthProviders>(builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Chip(
                              label: Text("LKR ${sneaker[index].price}0"),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (value.favId.contains(sneaker[index].id)) {
                                  value.removeFromFav(sneaker[index]);
                                } else {
                                  value.addToFav(sneaker[index]);
                                }

                              },
                              child: Icon(
                                  color: value.favId.contains(sneaker[index].id)
                                      ? Colors.redAccent
                                      : Colors.grey,
                                  value.favId.contains(sneaker[index].id)
                                      ? Icons.favorite
                                      : Icons.favorite_outline_rounded),
                            )
                          ],
                        ),
                        Positioned(
                            bottom: 5,
                            child: Text(
                              sneaker[index].title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                            ))
                      ],
                    ),
                  );
                }),
              );
            },
          );
        });
  }
}
