import 'package:flutter/material.dart';
import 'package:news_app_flutter/widgets/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: MyWidgets().MyAppBar(),
        backgroundColor: Colors.white,
        body: const Center(
          child: Text(
            "SearchPage",
            style: TextStyle(color: Colors.black, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
