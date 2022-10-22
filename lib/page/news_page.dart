import 'dart:convert';
import 'dart:ui';
import 'package:crypto_app_pi/sideBar.dart';
import 'package:http/http.dart' as http;
import 'package:crypto_app_pi/model/news.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'detail_news.dart';
import 'main.dart';
import 'package:crypto_app_pi/constants.dart';
import 'package:flutter/material.dart';

class newsPage extends StatefulWidget {
  const newsPage({Key? key}) : super(key: key);

  @override
  State<newsPage> createState() => _newsPageState();
}

class _newsPageState extends State<newsPage> {
  List _posts = [];
  void initState() {
    super.initState();
    _getData();
  }

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
                title: Text(
                  'News',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: _posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  color: Colors.grey[200],
                  height: 100,
                  width: 100,
                  child: _posts[index]['urlToImage'] != null
                      ? Image.network(
                          _posts[index]['urlToImage'],
                          width: 100,
                          fit: BoxFit.cover,
                        )
                      : Center(),
                ),
                title: Text(
                  '${_posts[index]['title']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  '${_posts[index]['description']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => Detail(
                        url: _posts[index]['url'],
                        title: _posts[index]['title'],
                        content: _posts[index]['content'],
                        publishedAt: _posts[index]['publishedAt'],
                        author: _posts[index]['author'],
                        urlToImage: _posts[index]['urlToImage'],
                      ),
                    ),
                  );
                },
              );
            }));
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/everything?q=bitcoin&apiKey=b9ef3df1048645ceab10cb5e8494634e'));

      if (response.statusCode == 200) {
        print(response.body);
        final data = json.decode(response.body);
        setState(() {
          _posts = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
