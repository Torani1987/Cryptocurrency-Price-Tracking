import 'dart:ui';

import 'package:crypto_app_pi/model/news.dart';
import 'package:crypto_app_pi/page/constants.dart';
import 'package:crypto_app_pi/page/detail_news.dart';
import 'package:crypto_app_pi/page/sideBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto_app_pi/view_model/news_view.dart';

import 'newsDetail.dart';

class NewsView extends GetWidget<NewsViewModel> {
  final controller = Get.put(NewsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sideBar(),
      backgroundColor: kbackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              backgroundColor: Colors.black.withOpacity(.2),
              title:
                  Text('News', style: Theme.of(context).textTheme.titleLarge),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: controller.getData(),
        builder: (context, AsyncSnapshot snapshot) {
          NewsModel? data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: data!.articles!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      color: Colors.grey[200],
                      height: 100,
                      width: 100,
                      child: data.articles![index].urlToImage.toString() != null
                          ? Image.network(
                              data.articles![index].urlToImage.toString(),
                              width: 100,
                              fit: BoxFit.cover,
                            )
                          : Center(),
                    ),
                    title: Text(
                      data.articles![index].title.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      data.articles![index].description.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => Detail(
                            url: data.articles![index].url,
                            title: data.articles![index].title,
                            content: data.articles![index].content,
                            publishedAt: data.articles![index].publishedAt,
                            author: data.articles![index].Author,
                            urlToImage: data.articles![index].urlToImage,
                          ),
                        ),
                      );
                    },
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
