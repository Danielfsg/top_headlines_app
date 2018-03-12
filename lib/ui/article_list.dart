import 'package:flutter/material.dart';
import 'package:top_headlines_app/ui/article_list_item.dart';
import 'package:top_headlines_app/model/article.dart';

class ArticleList extends StatelessWidget {
  final List<Article> _articleModel;

  ArticleList(this._articleModel);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: new EdgeInsets.symmetric(vertical: 8.0),
      children: _buildArticleList(),
    );
  }

  List<ArticleListItem> _buildArticleList() {
    return _articleModel
        .map((article) => new ArticleListItem(article))
        .toList();
  }

}