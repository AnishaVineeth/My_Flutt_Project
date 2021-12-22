import 'package:flutter/material.dart';
import 'package:flutter_news/models/news_model.dart';
import 'package:flutter_news/services/api_manager.dart';

class NewsDetail extends StatefulWidget {
  //final NewsModel? newsmodel;

  const NewsDetail({
    Key? key,
    //required this.newsmodel
  }) : super(key: key);

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  late Future<NewsModel?> newsModel;

  @override
  void initState() {
    newsModel = APIManager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(' News Detail')),
        body: FutureBuilder<NewsModel?>(
            future: newsModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: (context, index) {
                      var article = snapshot.data!.articles![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                article.title!,
                                style: TextStyle(color: Colors.pinkAccent),
                              ),
                              Container(
                                height: 80,
                                child: Card(
                                  child: Text(
                                    article.content!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })
        // Container(
        //   color: Colors.teal,
        // ),
        );
  }
}
