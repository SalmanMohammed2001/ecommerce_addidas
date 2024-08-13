import 'package:ecommerce_addidas/components/custom_button/custom_button1.dart';
import 'package:ecommerce_addidas/model/SneakerModel.dart';
import 'package:ecommerce_addidas/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.sneakerModel});

  final SneakerModel sneakerModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<CartProvider>(builder: (context, value, child) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: 200,
                    child: Stack(
                      children: [
                        const SafeArea(
                          child: BackButton(),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.network(
                              fit: BoxFit.cover,
                              width: size.width * 0.7,
                              height: size.height * 0.7,
                              sneakerModel.image),
                        ),
                        Positioned(
                            bottom: 5,
                            right: 5,
                            child: Container(
                              width: 105,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.amber.shade800,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  "LKR ${sneakerModel.price} /=",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    sneakerModel.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    sneakerModel.description,
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade800),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Quantity",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.amber.shade900,
                            borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                value.decrementQuantity();
                              },
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.blue.withOpacity(0.3),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "${value.quantity}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            GestureDetector(
                              onTap: () {
                                value.incrementQuantity();
                              },
                              child: CircleAvatar(
                                radius: 18,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.blue.withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //  const SizedBox(height: 10,),
              Positioned(
                bottom: 5,
                left: 1,
                right: 1,
                child: CustomButton1(
                  size: size,
                  text: "Add To Cart",
                  bgColor: Colors.amber.shade800,
                  onTap: () {},
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
