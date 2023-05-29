import 'package:flutter/material.dart';

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

  Padding homePageTitle(String text1,text2) {
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
            child:  Text(
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
}
