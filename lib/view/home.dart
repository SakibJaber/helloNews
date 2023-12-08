import 'package:flutter/material.dart';
import 'package:hello_news/view/all_news.dart';
import 'package:hello_news/view/breaking_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
              title: const Text('Hello News'),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: 'Breaking',
                  ),
                  Tab(
                    text: 'All News',
                  )
                ],
              )),
          body: const TabBarView(
            children: [BreakingNews(), AllNews()],
          ),
        ));
  }
}
