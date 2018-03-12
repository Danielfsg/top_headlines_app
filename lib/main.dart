import 'package:flutter/material.dart';
import 'package:top_headlines_app/ui/article_page.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("NewsApi"),
      ),
      body: new ArticlePage(),
    ),
  ));
}

