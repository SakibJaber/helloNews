// ignore_for_file: library_private_types_in_public_api
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hello_news/model/news.model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDetails({Key? key, required this.newsModel}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.newsModel.title.toString()),
        ),
        body: Column(
          children: [
            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: widget.newsModel.urlToImage.toString(),
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
                    widget.newsModel.source!.name.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                Text(widget.newsModel.publishedAt.toString())
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(widget.newsModel.author == null
                ? "Author: ${widget.newsModel.source!.name}"
                : "Author: ${widget.newsModel.author}"),
            const SizedBox(height: 8),
            Text(widget.newsModel.title.toString()),
            const SizedBox(height: 8),
            Text(widget.newsModel.description.toString()),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: () async {
                  final Uri uri = Uri.parse(widget.newsModel.url.toString());
                  if (!await launchUrl(uri)) {
                    throw Exception('Could Not launch');
                  }
                },
                child: Text('Read more...'))
          ],
        ));
  }
}
