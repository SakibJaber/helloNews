// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hello_news/components/news_item.dart';
import 'package:hello_news/model/news.model.dart';
import 'package:hello_news/service/api.service.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({Key? key}) : super(key: key);

  @override
  _BreakingNewsState createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getBreakingNews(),
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
