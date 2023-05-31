import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/news_model.dart';
import 'package:news_app_flutter/widgets/widgets.dart';

class DetailPage extends StatefulWidget {
  final List<Articles>? newsList;
  final int i;

  const DetailPage(this.newsList, this.i, {Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [toolbarToCollapse(context), pageContent()],
      ),
    );
  }

  SliverAppBar toolbarToCollapse(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height / 2,
      flexibleSpace: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        child: FlexibleSpaceBar(
          background: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                child: FlexibleSpaceBar(
                  background: Image.network(
                    widget.newsList![widget.i].urlToImage.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ClipRRect(
                child: ColoredBox(color: Colors.black.withOpacity(0.5)),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
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
                            child: MyWidgets().glassMorphismText(widget
                                .newsList![widget.i].source!.name
                                .toString()),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          widget.newsList![widget.i].title.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "AppFont",
                              fontSize: 25),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.newsList![widget.i].description.toString(),
                          style: TextStyle(
                              color: Colors.grey, fontFamily: "AppFont"),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floating: true,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 40,
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  Widget pageContent() => SliverToBoxAdapter(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    rowContent(
                      widget.newsList![widget.i].author.toString(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    rowContent(
                      widget.newsList![widget.i].publishedAt
                          .toString()
                          .substring(0, 10),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    widget.newsList![widget.i].title.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "AppFont"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.newsList![widget.i].content.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontFamily: "AppFont"),
                  ),
                  Text(
                    widget.newsList![widget.i].content.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontFamily: "AppFont"),
                  ),
                  Text(
                    widget.newsList![widget.i].content.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontFamily: "AppFont"),
                  ),
                  Text(
                    widget.newsList![widget.i].content.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontFamily: "AppFont"),
                  ),
                  Text(
                    widget.newsList![widget.i].content.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontFamily: "AppFont"),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Container rowContent(String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(15),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style:
            TextStyle(fontSize: 15, color: Colors.white, fontFamily: "AppFont"),
      ),
    );
  }
}
