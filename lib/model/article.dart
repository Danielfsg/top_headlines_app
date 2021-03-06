import 'package:flutter/material.dart';

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final Source source;

  Article(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.source});

  Article.map(Map<dynamic, dynamic> map)
      : author = map["author"],
        title = map["title"],
        description = map["description"],
        url = map["url"],
        urlToImage = map["urlToImage"],
        publishedAt = map["publishedAt"],
        source = new Source.map(map['source']);
}

class Source {
  final String id;
  final String name;

  Source({this.id, this.name});

  Source.map(Map<dynamic, dynamic> map)
      : id = map['id'],
        name = map['name'];
}

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}
