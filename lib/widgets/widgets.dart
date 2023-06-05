import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/news_model.dart';
import 'package:news_app_flutter/navigation/nav_bar.dart';
import 'package:news_app_flutter/service/api_service.dart';
import 'dart:ui';

import 'package:news_app_flutter/view/more_page.dart';

class MyWidgets {
  AppBar MyAppBar(BuildContext context, Color clr) {
    return AppBar(
      leading: Builder(
        builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: clr,
                size: 35,
              ));
        },
      ),
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
                  builder: (context) => MorePage(text1, list, text2)));
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

  Container searchNews(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: TextField(
        cursorColor: Colors.black,
        onSubmitted: (value) {
          ApiService().fetchNewsByUserInput(value).then((data) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  MorePage("'$value'", data!.articles, "Everything about"),
            ));
          }).catchError((error) {
            print(error);
          });
        },
        style: const TextStyle(color: Colors.black, fontFamily: "AppFont"),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(158, 228, 228, 228),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          suffixIcon: const Icon(
            Icons.filter_alt,
            color: Color.fromARGB(255, 135, 135, 135),
          ),
          hintText: "Search for news",
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.4),
            fontFamily: "AppFont",
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color.fromARGB(255, 135, 135, 135),
          ),
        ),
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
                Colors.white.withOpacity(0.1),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: 200), // İstediğiniz maksimum genişlik değeri
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: "AppFont",
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
