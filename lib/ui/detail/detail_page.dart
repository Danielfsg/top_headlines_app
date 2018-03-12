import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:top_headlines_app/model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = "/detail";
  final Article _article;

  DetailPage(this._article);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(),
        body: new Container(
          margin: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Flexible(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _container(
                        new Text(_article.title,
                          style: new TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        )
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _container(
                          new Text(_article.publishedAt.substring(0, 10) + " " +
                              _article.publishedAt.substring(11, 16),
                              style: new TextStyle(
                                  fontSize: 11.0,
                                  fontStyle: FontStyle.italic)
                          ),
                        ),
                        _container(
                            new Text(_article.source.name.toLowerCase(),
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    fontStyle: FontStyle.italic)
                            )
                        )
                      ],
                    ),
                    new Center(
                      child: _container(
                        new CachedNetworkImage(
                          imageUrl: _article.urlToImage != null ? _article.urlToImage :"",
                          errorWidget: new Icon(Icons.error),
                        ),

                      ),
                    ),
                    _container(
                        new Text(_article.description)
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _container(
                            new FlatButton(
                                child: new Text("Link para a notícia completa",
                                  style: new TextStyle(
                                      decoration: TextDecoration.underline),),
                                onPressed: () => _launchInBrowser(_article.url)
                            )
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget _container(Widget child) {
    return new Container(
      margin: new EdgeInsets.symmetric(
          vertical: 4.0, horizontal: 8.0),
      child: child,
    );
  }

  _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}