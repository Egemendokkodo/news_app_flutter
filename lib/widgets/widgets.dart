import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/news_model.dart';
import 'package:news_app_flutter/navigation/nav_bar.dart';
import 'dart:ui';

import 'package:news_app_flutter/view/more_page.dart';

class MyWidgets {
  AppBar MyAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Padding homePageTitle(
      BuildContext context, String text1, text2, List<Articles>? list) {
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MorePage(text1, list)));
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
        Expanded(
          child: Center(
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
