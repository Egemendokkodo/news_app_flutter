import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/news_model.dart';
import 'package:news_app_flutter/view/news_detail_page.dart';

class MorePage extends StatefulWidget {
  final String text1;
  final List<Articles>? list;
  const MorePage(this.text1, this.list, {super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Text(
            "More '${widget.text1}'",
            style: TextStyle(
                color: Colors.black, fontFamily: "AppFontBold", fontSize: 20),
          ),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: widget.list!.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailPage(widget.list, index)));
                  },
                  child: ListTile(
                    shape: Border.all(color: Colors.black, width: 1),
                    leading: Image.network(
                      widget.list![index].urlToImage.toString(),
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                    title: Text(
                      widget.list![index].title.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black, fontFamily: "AppFontBold"),
                    ),
                    subtitle: Text(
                      widget.list![index].description.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: Colors.grey, fontFamily: "AppFont"),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
