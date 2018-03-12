import 'package:flutter/material.dart';
import 'package:top_headlines_app/model/article.dart';
import 'package:top_headlines_app/ui/detail/detail_page.dart';

class ArticleListItem extends StatelessWidget {
  final Article _article;

  ArticleListItem(this._article);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(_article.title != null ? _article.title : ""),
      subtitle: new Text(_article.source.name != null
          ? _article.source.name.toLowerCase()
          : ""),
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => new DetailPage(_article)));
      },
    );
  }
}
