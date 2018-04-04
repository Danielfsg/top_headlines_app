import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progress_hud/progress_hud.dart';
import 'package:top_headlines_app/data/network_data.dart';
import 'package:top_headlines_app/model/article.dart';
import 'package:top_headlines_app/ui/article_list/article_list.dart';
import 'package:top_headlines_app/utils/constants.dart';
import 'package:top_headlines_app/utils/utils.dart';

class ArticlesPage extends StatefulWidget {
  final String category;

  ArticlesPage(this.category);

  @override
  _ArticlePageState createState() => new _ArticlePageState();
}

class _ArticlePageState extends State<ArticlesPage> {
  bool _loading = true;
  NetworkData _network = new NetworkData();
  List<Article> _list = new List<Article>();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
              "Top Headlines ${Utils.capitalizeString(widget.category)}"),
        ),
        body: new Builder(builder: (context) {
          return (!_loading)
              ? new Container(
                  child: new ArticleList(_list),
                )
              : new Container(
                  child: new Center(
                      child: new ProgressHUD(
                    backgroundColor: Colors.black12,
                    color: Colors.white,
                    containerColor: Colors.blue,
                    borderRadius: 5.0,
                  )),
                );
        }));
  }

  _fetchData() async {
    Completer<Null> completer = new Completer<Null>();

    _network
        .fetchTopHeadlinesByCategory(country.keys.elementAt(0), widget.category)
        .then((obj) {
      setState(() {
        _loading = false;
        _list = obj;
      });
      completer.complete();
    });

    return completer.future;
  }
}
