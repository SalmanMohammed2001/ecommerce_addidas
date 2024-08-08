

import 'package:flutter/material.dart';

import '../../../../model/SneakerModel.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.sneaker,
  });

  final List<SneakerModel> sneaker;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: sneaker.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Chip(
                      label: Text("LKR ${sneaker[index].price}0"),
                    ),
                    const Icon(
                        color: Colors.grey,
                        Icons.favorite_outline_rounded)
                  ],
                ),
                Positioned(
                    bottom: 5,
                    child: Text(
                      sneaker[index].title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
