
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hello_news/model/news.model.dart';
import 'package:hello_news/view/news_details.dart';

class NewsItem extends StatelessWidget {
  final NewsModel newsModel;
  const NewsItem({Key? key, required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetails(newsModel: newsModel)));
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                height: 250,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                imageUrl: newsModel.urlToImage.toString(),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.green[700],
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      newsModel.source!.name.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(newsModel.publishedAt.toString())
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(newsModel.author == null
                  ? "Author: ${newsModel.source!.name}"
                  : "Author: ${newsModel.author}"),
              const SizedBox(height: 8),
              Text(newsModel.title.toString())
            ],
          )),
    );
  }
}
