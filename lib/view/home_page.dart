import 'package:flutter/material.dart';
import 'package:news_app_flutter/service/api_service.dart';
import 'package:news_app_flutter/widgets/widgets.dart';
import 'package:news_app_flutter/model/news_model.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<NewsModel?> news;
  List<Articles>? newsList = [];
  final ApiService _service = ApiService();

  @override
  void initState() {
    super.initState();

    news = _service.fetchTopHeadlines();
    _service.fetchTopHeadlines().then((value) {
      if (value != null) {
        setState(() {
          newsList = value.articles;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: MyWidgets().MyAppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              newsOfTheDayContainer(context),
              MyWidgets().homePageTitle("Breaking news", "More"),
              ScrollableRowContent(ApiService().fetchTopHeadlines()),
              MyWidgets().homePageTitle("News from Usa", "More"),
              ScrollableRowContent(ApiService().fetchNewsByCountry()),
            ],
          ),
        ));
  }

  Container ScrollableRowContent(Future<NewsModel?> function) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: FutureBuilder(
              future: function,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: NetworkImage(snapshot
                                              .data!.articles![index].urlToImage
                                              .toString()),
                                          width: 210,
                                          height: 170,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: 210,
                                        child: Text(
                                          snapshot.data!.articles![index].title
                                              .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontFamily: "AppFontBold",
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      SizedBox(
                                        width: 210,
                                        child: Text(
                                          snapshot.data!.articles![index]
                                              .publishedAt
                                              .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontFamily: "AppFontBold",
                                            color: Color.fromARGB(
                                                233, 220, 220, 220),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      SizedBox(
                                        width: 210,
                                        child: Text(
                                          snapshot.data!.articles![index].author
                                              .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontFamily: "AppFontBold",
                                            color: Color.fromARGB(
                                                233, 220, 220, 220),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            );
                          }),
                    ),
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

  SizedBox newsOfTheDayContainer(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            child: Image.network(
              newsList![0].urlToImage.toString(),
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            child: ColoredBox(color: Colors.black.withOpacity(0.5)),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: 150,
                      height: 40,
                      child: Stack(
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
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "news of the day",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "AppFont"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    newsList![0].title.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "AppFont",
                        fontSize: 25),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      print("learn more");
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Learn More',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "AppFont"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
