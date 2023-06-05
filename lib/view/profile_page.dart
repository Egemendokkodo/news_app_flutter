import 'package:flutter/material.dart';
import "package:news_app_flutter/widgets/shimmer_widget.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;
  List<String> texts = [
    "Profile",
    "Saved",
    "Settings",
    "Change Password",
    "Language",
  ];
  List<IconData> icons = [
    Icons.person,
    Icons.bookmark,
    Icons.settings,
    Icons.visibility,
    Icons.language
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future loadData() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 8), () {});
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: ClipOval(
                        child: Image.network(
                      "https://datepsychology.com/wp-content/uploads/2022/09/gigachad.jpg",
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Egemen Sevgi",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "AppFontBold",
                          ),
                        ),
                        Text(
                          "egemensvg@gmail.com",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "AppFont",
                              backgroundColor: Colors.transparent),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 500,
                  height: 500,
                  child: ListView.builder(
                      itemCount: isLoading ? 5 : texts.length,
                      itemBuilder: (context, index) {
                        if (isLoading) {
                          return buildShimmer();
                        } else {
                          return InkWell(
                              onTap: () {},
                              child: buildList(texts[index], icons[index]));
                        }
                      }),
                ),
              )
            ],
          ),
        ));
  }

  Widget buildShimmer() => const ListTile(
        leading: ShimmerWidget.circular(width: 64, height: 64),
        title: ShimmerWidget.rectangular(height: 16),
      );
  Widget buildList(String text, IconData icon) => ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(
          text,
          style: TextStyle(color: Colors.black, fontFamily: "AppFontBold"),
        ),
      );
}
