import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/ApiManager.dart';
import '../../../model/sourcesResponse/Source.dart';
import 'NewsWidget.dart';

class NewsListWidget extends StatelessWidget {
  Source source;
  NewsListWidget(this.source, {super.key});

  @override
  Widget build(BuildContext context) {
    //call api
    return FutureBuilder(
        future: ApiManager.getNews(source.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data?.status == "error") {
            return Center(
              child: Column(
                children: [
                  Text(snapshot.data?.message ?? snapshot.error.toString()),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Try again"))
                ],
              ),
            );
          }
          var newsList = snapshot.data?.articles;

          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsWidget(newsList![index]);
            },
            itemCount: newsList?.length ?? 0,
          );
        });
  }
}
