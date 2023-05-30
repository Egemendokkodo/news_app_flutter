import 'package:flutter/material.dart';
import 'package:news_app_flutter/navigation/nav_bar.dart';
import 'package:news_app_flutter/service/api_service.dart';
import 'package:news_app_flutter/view/news_detail_page.dart';
import 'package:news_app_flutter/widgets/widgets.dart';
import 'package:news_app_flutter/model/news_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<NewsModel?> news;
  late Future<NewsModel?> country;
  List<Articles>? topHeadlinesList = [];
  List<Articles>? countryList = [];
  final ApiService _service = ApiService();

  @override
  void initState() {
    super.initState();

    news = _service.fetchTopHeadlines();
    country = _service.fetchNewsByCountry();
    _service.fetchTopHeadlines().then((value) {
      if (value != null) {
        setState(() {
          topHeadlinesList = value.articles;
        });
      }
    });
    _service.fetchNewsByCountry().then((value) {
      if (value != null) {
        setState(() {
          countryList = value.articles;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        extendBodyBehindAppBar: true,
        appBar: MyWidgets().MyAppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              newsOfTheDayContainer(context),
              MyWidgets().homePageTitle(
                  context, "Breaking news", "More", topHeadlinesList),
              ScrollableRowContent(
                  ApiService().fetchTopHeadlines(), topHeadlinesList),
              MyWidgets()
                  .homePageTitle(context, "News from Usa", "More", countryList),
              ScrollableRowContent(
                  ApiService().fetchNewsByCountry(), countryList),
            ],
          ),
        ));
  }

  Row ScrollableRowContent(Future<NewsModel?> function, List<Articles>? list) {
    return Row(
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
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(list, index)));
                            },
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        image: snapshot.data!.articles![index]
                                                    .urlToImage !=
                                                null
                                            ? NetworkImage(snapshot.data!
                                                .articles![index].urlToImage
                                                .toString())
                                            : NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxCPerXGwYsY2R0Mx9uih5q4KeI-QV-uArGA&usqp=CAU'),
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
                                        snapshot
                                            .data!.articles![index].publishedAt
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
    );
  }

  GestureDetector newsOfTheDayContainer(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(topHeadlinesList, 0)));
      },
      child: SizedBox(
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
                topHeadlinesList![0].urlToImage != null
                    ? topHeadlinesList![0].urlToImage.toString()
                    : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxCPerXGwYsY2R0Mx9uih5q4KeI-QV-uArGA&usqp=CAU',
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
                        child: MyWidgets().glassMorphismText("news of the day"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      topHeadlinesList![0].title.toString(),
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(topHeadlinesList, 0)));
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
      ),
    );
  }
}
