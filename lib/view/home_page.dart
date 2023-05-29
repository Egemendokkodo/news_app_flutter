import 'package:flutter/material.dart';
import 'package:news_app_flutter/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

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
            "HomePage",
            style: TextStyle(color: Colors.black, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
