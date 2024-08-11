import 'package:ecommerce_addidas/components/custom_button/custom_button1.dart';
import 'package:ecommerce_addidas/components/custom_text_field/custom_text_field1.dart';
import 'package:ecommerce_addidas/provider/admin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
      ),
      body: SafeArea(
          child: Consumer<AdminProvider>(builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Divider(),
                GestureDetector(
                  onTap: () {
                    value.pickImage(context);
                  },
                  child: Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: value.imageFile != null
                              ? DecorationImage(
                                  image: FileImage(value.imageFile!),
                                  fit: BoxFit.cover)
                              : null),
                      child: value.imageFile == null
                          ? const CircleAvatar(
                              radius: 100,
                              child: Icon(
                                Icons.add,
                                size: 80,
                              ),
                            )
                          : null),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField1(
                    label: "Product Name",
                    prefixIcon: Icons.production_quantity_limits_outlined,
                    controller: value.nameController),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField1(
                    label: "Description",
                    prefixIcon: Icons.production_quantity_limits_outlined,
                    controller: value.descriptionController),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField1(
                  label: "Price",
                  prefixIcon: Icons.production_quantity_limits_outlined,
                  controller: value.priceController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton1(
                  size: MediaQuery.sizeOf(context),
                  text: "Add Product",
                  bgColor: Colors.orange.shade800,
                  onTap: () {
                    value.addProduct(context);
                  },
                )
              ],
            ),
          ),
        );
      })),
    );
  }
}
