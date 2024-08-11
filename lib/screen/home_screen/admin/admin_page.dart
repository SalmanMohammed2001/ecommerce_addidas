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
    return  Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard"),),
      body: SafeArea(child: Consumer<AdminProvider>(
        builder: (context,value,child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Divider(),
                CustomTextField1(label: "Product Name", prefixIcon: Icons.production_quantity_limits_outlined, controller: value.nameController),
              ],
            ),
          );
        }
      )),
    );
  }
}
