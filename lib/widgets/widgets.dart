import 'package:flutter/material.dart';
import 'dart:ui';

class MyWidgets {
  AppBar MyAppBar() {
    return AppBar(
      leading: const Icon(
        Icons.menu,
        color: Colors.white,
        size: 40,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Padding homePageTitle(String text1, text2) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Text(
            text1,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: "AppFontBold",
              fontSize: 22,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              print("textButton");
            },
            child: Text(
              text2,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: "AppFontBold",
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Stack glassMorphismText(String text) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Container(),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.4),
              Colors.white.withOpacity(0.1)
            ],
          )),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontFamily: "AppFont"),
            ),
          ),
        ),
      ],
    );
  }
}
