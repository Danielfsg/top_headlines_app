import 'package:flutter/material.dart';
import 'package:top_headlines_app/model/article.dart';

class ArticleListItem extends StatelessWidget {
  final Article _article;

  ArticleListItem(this._article);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(_article.title != null ? _article.title : ""),
      subtitle: new Text(_article.source.name != null ? _article.source.name.toLowerCase() : ""),
    );
  }
}