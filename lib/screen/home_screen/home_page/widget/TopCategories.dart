

import 'package:flutter/material.dart';

import '../../../../components/custom_text/custom_text.dart';


class TopCategories extends StatelessWidget {
   TopCategories({
    super.key,

  });

  final List<dynamic> icons = [
    Icons.ac_unit,
    Icons.account_balance_sharp,
    Icons.car_rental,
    Icons.shopping_cart_rounded,
    Icons.domain_verification_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
   // Row(
   //   children: [
   //     const CustomText(
   //       text: "Top Categories",
   //       fontWeight: FontWeight.w800,
   //     ),
   //     CustomText(
   //       text: "See All",
   //       color: Colors.orange.shade700,
   //       fontsize: 16,
   //       fontWeight: FontWeight.w300,
   //     ),
   //   ],
   // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const SizedBox(
              height: 15,
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
          ],
        ),
      ],
    );
  }
}
