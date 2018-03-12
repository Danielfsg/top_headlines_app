import 'package:flutter/material.dart';
import 'package:top_headlines_app/data/network_data.dart';
import 'package:top_headlines_app/model/article.dart';
import 'package:top_headlines_app/ui/article_list.dart';


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
    return new FutureBuilder(
      future: _network.fetchTopHeadlines().then((obj) => _list = obj),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? new Scaffold(
            body: new ArticleList(_list)
        )
            : new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new CircularProgressIndicator()
              ],
            ),
          ),);
      },);
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