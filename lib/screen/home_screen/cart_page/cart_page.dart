
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  List<SneakerModel> sneaker = DemoData.sneakers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                  itemCount: DemoData.sneakers.length,
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
                                      image:
                                          NetworkImage(sneaker[index].image))),
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
                            Container(
                              width: 80,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: const Color(0XFFEBEEF0),
                                  border:
                                      Border.all(color: Colors.orange.shade900),
                                  borderRadius: BorderRadius.circular(35)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.remove,
                                    color: Colors.orange.shade900,
                                  ),
                                  const CustomText(
                                    text: "1",
                                    fontsize: 18,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.orange.shade900,
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
                            text: "LkR 12000",
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
          ),
        ),
      ),
    );
  }
}
