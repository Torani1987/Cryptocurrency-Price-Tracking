class News {
  final String title;
  final String link;
  final String content;
  final String pubDate;
  final String imageUrl;
  final String source_id;
  const News({
    required this.title,
    required this.link,
    required this.content,
    required this.pubDate,
    required this.imageUrl,
    required this.source_id,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      link: json['link'],
      content: json['content'],
      pubDate: json['pubDate'],
      imageUrl: json['imageUrl'],
      source_id: json['source_id'],
    );
  }
}
