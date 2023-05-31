import 'package:news_app_flutter/model/news_model.dart';
import 'package:news_app_flutter/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/navigation/nav_bar.dart';
import 'package:news_app_flutter/widgets/widgets.dart';
import 'package:news_app_flutter/view/news_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  List<String> categories = [
    "general",
    "entertainment",
    "business",
    "health",
    "science",
    "sports",
    "technology"
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 7, vsync: this);
    return Scaffold(
      drawer: NavBar(),
      extendBodyBehindAppBar: false,
      appBar: MyWidgets().MyAppBar(context, Colors.black),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 70),
                child: Text(
                  "Discover",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "AppFontBold",
                      fontSize: 40),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "News from all over the world",
                  style: TextStyle(
                      color: Colors.grey, fontFamily: "AppFont", fontSize: 20),
                ),
              ),
              MyWidgets().searchNews(),
              Column(
                children: [],
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: TabBar(
                  indicatorColor: Colors.black,
                  controller: _tabController,
                  labelPadding: EdgeInsets.all(5),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Text(
                        categories[0].replaceFirst(
                            categories[0][0], categories[0][0].toUpperCase()),
                        style:
                            TextStyle(fontSize: 20, fontFamily: "AppFontBold"),
                      ),
                    ),
                    Tab(
                      child: Text(
                        categories[1].replaceFirst(
                            categories[1][0], categories[1][0].toUpperCase()),
                        style:
                            TextStyle(fontSize: 20, fontFamily: "AppFontBold"),
                      ),
                    ),
                    Tab(
                      child: Text(
                        categories[2].replaceFirst(
                            categories[2][0], categories[2][0].toUpperCase()),
                        style:
                            TextStyle(fontSize: 20, fontFamily: "AppFontBold"),
                      ),
                    ),
                    Tab(
                      child: Text(
                        categories[3].replaceFirst(
                            categories[3][0], categories[3][0].toUpperCase()),
                        style:
                            TextStyle(fontSize: 20, fontFamily: "AppFontBold"),
                      ),
                    ),
                    Tab(
                      child: Text(
                        categories[4].replaceFirst(
                            categories[4][0], categories[4][0].toUpperCase()),
                        style:
                            TextStyle(fontSize: 20, fontFamily: "AppFontBold"),
                      ),
                    ),
                    Tab(
                      child: Text(
                        categories[5].replaceFirst(
                            categories[5][0], categories[5][0].toUpperCase()),
                        style:
                            TextStyle(fontSize: 20, fontFamily: "AppFontBold"),
                      ),
                    ),
                    Tab(
                      child: Text(
                        categories[6].replaceFirst(
                            categories[6][0], categories[6][0].toUpperCase()),
                        style:
                            TextStyle(fontSize: 20, fontFamily: "AppFontBold"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: TabBarView(controller: _tabController, children: [
                  tabbarList("general"),
                  tabbarList("entertainment"),
                  tabbarList("business"),
                  tabbarList("health"),
                  tabbarList("science"),
                  tabbarList("sports"),
                  tabbarList("technology"),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container tabbarList(String category) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
            child: FutureBuilder(
              future: ApiService().fetchNewsByCategory(category),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final items = snapshot.data!.articles;
                  return SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: items!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          DetailPage(items, index)));
                                },
                                child: ListTile(
                                  shape:
                                      Border.all(color: Colors.black, width: 1),
                                  leading: Image.network(
                                    items[index].urlToImage.toString(),
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                  title: Text(
                                    items[index].title.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "AppFontBold"),
                                  ),
                                  subtitle: Text(
                                    items[index].description.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "AppFont"),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
