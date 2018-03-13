import 'package:flutter/material.dart';
import 'package:top_headlines_app/data/network_data.dart';
import 'package:top_headlines_app/ui/article_list/article_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return new Scaffold(
        appBar: new AppBar(title: new Text("Choose a Category")),
        body: buildGrid()
    );
  }

  Widget buildGrid() {
    return new GridView.extent(
        maxCrossAxisExtent: 300.0,
        padding: const EdgeInsets.all(8.0),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: _buildGridTileList(7)

    );
  }

  List<Container> _buildGridTileList(int count) {
    return new List<Container>.generate(count,
            (int index) =>
        new Container(
          child: new GestureDetector(
            child: new Card(
              color: Colors.blue,
              child: new Center(
                  child: new Text( CategoryType.category[index][0].toUpperCase()+ CategoryType.category[index].substring(1),
                      style: new TextStyle(fontSize: 20.0))
              ),
            ),
            onTap: () {
              Navigator.push(
               _context,
              new MaterialPageRoute(
              builder: (BuildContext context) => new ArticlesPage(CategoryType.category[index])));
            },
          ),
        )
    );
  }
}