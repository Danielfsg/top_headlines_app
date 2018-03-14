import 'package:flutter/material.dart';
import 'package:top_headlines_app/data/network_data.dart';
import 'package:top_headlines_app/ui/article_list/article_page.dart';
import 'package:top_headlines_app/ui/settings/settings_page.dart';
import 'package:top_headlines_app/utils/utils.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Choose a Category"),
          actions: <Widget>[
            new PopupMenuButton<Choice>( // overflow menu
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.map((Choice c) {
                  return new PopupMenuItem<Choice>(
                    value: c,
                    child: new Text(c.title),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: buildGrid()
    );
  }

  void _select(Choice c) {
    if (c.title == "Settings") {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) =>
                  new SettingsPage()
          )
      );
    }
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
                  child: new Text(
                      Utils.capitalizeString(CategoryType.category[index]),
                      style: new TextStyle(fontSize: 20.0))
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new ArticlesPage(CategoryType.category[index])
                  )
              );
            },
          ),
        )
    );
  }
}

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Settings', icon: Icons.settings),
  const Choice(title: 'About', icon: Icons.info),
];
