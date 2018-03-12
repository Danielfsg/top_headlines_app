import 'package:flutter/material.dart';
import 'package:progress_hud/progress_hud.dart';
import 'package:top_headlines_app/data/network_data.dart';
import 'package:top_headlines_app/model/article.dart';
import 'package:top_headlines_app/ui/article_list/article_list.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => new _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  NetworkData _network = new NetworkData();
  List<Article> _list = new List<Article>();

  //bool _loading = true;

  /*
  @override
  void initState() {
    super.initState();
    //_fetchData();
  }
  */

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Top Headlines"),
      ),
      body: new FutureBuilder(
        future: _network.fetchTopHeadlines().then((obj) => _list = obj),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? new Container(child: new ArticleList(_list))
              : new Container(
                  child: new Center(child: new ProgressHUD(
                    backgroundColor: Colors.black12,
                    color: Colors.white,
                    containerColor: Colors.blue,
                    borderRadius: 5.0,
                  )),
                );
        },
      ),
    );
  }

/*
  _fetchData() async {
    await _network.fetchTopHeadlines().then((obj) => _list = obj);
    setState(() {
      _loading = false;
    });
  }
  */

}
