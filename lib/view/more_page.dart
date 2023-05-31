import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/news_model.dart';
import 'package:news_app_flutter/view/news_detail_page.dart';

class MorePage extends StatefulWidget {
  final String text1;
  final String text2;
  final List<Articles>? list;
  const MorePage(this.text1, this.list, this.text2, {super.key});

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
            "${widget.text2} '${widget.text1}'",
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
                      widget.list![index].urlToImage != null
                          ? widget.list![index].urlToImage.toString()
                          : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxCPerXGwYsY2R0Mx9uih5q4KeI-QV-uArGA&usqp=CAU',
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
