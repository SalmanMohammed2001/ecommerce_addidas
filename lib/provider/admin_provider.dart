import 'package:flutter/material.dart';

class AdminProvider extends ChangeNotifier{

  TextEditingController _nameController=TextEditingController();
  TextEditingController get nameController => _nameController;

}
