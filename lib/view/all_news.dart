import 'package:flutter/material.dart';
import 'package:hello_news/components/news_item.dart';
import 'package:hello_news/model/news.model.dart';
import 'package:hello_news/service/api.service.dart';

class AllNews extends StatefulWidget {
  const AllNews({ Key? key }) : super(key: key);

  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
    ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewsModel> articleList = snapshot.data ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(
                  newsModel: articleList[index],
                );
              },
              itemCount: articleList.length,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}