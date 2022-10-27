class Articles {
  String? title;
  String? description;
  String? urlToImage;
  String? content;
  String? publishedAt;
  String? Author;
  String? url;

  Articles({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.Author,
    required this.content,
    required this.publishedAt,
    required this.url,
  });

  Articles.fromjson(Map<String, dynamic> json) {
    this.title = json["title"];
    this.description = json["description"];
    this.Author = json["author"];
    this.content = json["content"];
    this.url = json["url"];
    this.urlToImage = json["urlToImage"];
  }
}

class NewsModel {
  List<Articles>? articles;

  NewsModel({this.articles});

  NewsModel.fromjson(Map<String, dynamic> json) {
    this.articles =
        (json["articles"] as List).map((e) => Articles.fromjson(e)).toList();
  }
}
