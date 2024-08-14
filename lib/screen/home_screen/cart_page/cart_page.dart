import 'package:ecommerce_addidas/model/cart_item_model.dart';
import 'package:ecommerce_addidas/provider/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_button/custom_button1.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../model/SneakerModel.dart';
import '../../../utils/DemoData.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<CartProvider>(builder: (context, value, child) {
            return Column(
              children: [
                const Row(
                  children: [
                    BackButton(),
                    Spacer(),
                    CustomText(
                      text: "My Cart",
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cartItem.length,
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
                                        image: NetworkImage(value
                                            .cartItem[index].model.image))),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: value.cartItem[index].model.title,
                                    fontsize: 15,
                                  ),
                                  Chip(
                                    label: Text(
                                        "LKR ${value.cartItem[index].model.price * value.cartItem[index].quantity}00"),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.amber.shade900,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        value.decreaseCartItemQuantity(index);
                                      },
                                      child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor:
                                            Colors.blue.withOpacity(0.3),
                                        child: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${value.cartItem[index].quantity}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        value.increaseCartItemQuantity(index);
                                      },
                                      child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor:
                                            Colors.blue.withOpacity(0.3),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                              text: "Total",
                              color: Colors.white,
                            ),
                            CustomText(
                              text: value.calculateTotal(),
                              color: Colors.orange.shade300,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton1(
                          size: MediaQuery.sizeOf(context),
                          text: "Buy Now",
                          bgColor: Colors.orange,
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
