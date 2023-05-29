import 'package:flutter/material.dart';
class MyWidgets{

  AppBar MyAppBar() {
    return AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      );
  }
}