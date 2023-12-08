// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:hello_news/model/news.model.dart';
import 'package:http/http.dart';

class ApiService {
  final all_news_url =
      "https://newsapi.org/v2/everything?q=*&apiKey=52eec25bb62e4ff287e44124b49c6820";

  final breaking_news_url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=52eec25bb62e4ff287e44124b49c6820";

  Future<List<NewsModel>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(all_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articlesList =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articlesList;
      } else {
        throw ('News not found');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      Response response = await get(Uri.parse(breaking_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articlesList =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articlesList;
      } else {
        throw ('News not found');
      }
    } catch (e) {
      rethrow;
    }
  }
}
