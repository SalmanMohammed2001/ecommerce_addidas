
import 'package:ecommerce_addidas/screen/home_screen/home_page/widget/CustomActionButton.dart';
import 'package:ecommerce_addidas/screen/home_screen/home_page/widget/CustomSlider.dart';
import 'package:ecommerce_addidas/screen/home_screen/home_page/widget/ProductGrid.dart';
import 'package:ecommerce_addidas/screen/home_screen/home_page/widget/TopCategories.dart';
import 'package:flutter/material.dart';


import '../../../components/custom_text/custom_text.dart';
import '../../../model/SneakerModel.dart';
import '../../../utils/DemoData.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SneakerModel> sneaker = DemoData.sneakers;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final List<dynamic> icons = [
      Icons.ac_unit,
      Icons.account_balance_sharp,
      Icons.car_rental,
      Icons.shopping_cart_rounded,
      Icons.domain_verification_outlined,
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomActionButton(),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: "Hello Salman",
                  fontWeight: FontWeight.w500,
                ),
                CustomText(
                  text: "Let's Start shopping",
                  fontsize: 15,
                  color: Colors.grey.shade500,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomSlider(),
                const SizedBox(
                  height: 15,
                ),
              //  TopCategories(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const CustomText(
                      text: "Top Categories",
                      fontWeight: FontWeight.w800,
                    ),
                    CustomText(
                      text: "See All",
                      color: Colors.orange.shade700,
                      fontsize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                      icons.length,
                          (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: index == 0
                                  ? Colors.orange
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: index == 0
                                      ? Colors.orange.shade700
                                      : Colors.grey.shade400),
                            ),
                            child: Icon(
                              icons[index],
                              color: index == 0
                                  ? Colors.white
                                  : Colors.grey.shade600,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),
                ProductGrid(sneaker: sneaker)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
