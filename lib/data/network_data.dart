import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:top_headlines_app/api_key.dart';
import 'package:top_headlines_app/model/article.dart';

class CategoryType {
  static List<String> category = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];
}

class NetworkData {
  final String _apiKey = API.apiKey; // your api key here
  final String _country = "us";
  final JsonDecoder _decoder = new JsonDecoder();
  List _data;

  Future<dynamic> _request(String url) {
    return http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<List<Article>> fetchTopHeadlines() {
    return _request(
        "https://newsapi.org/v2/top-headlines?country=$_country&apiKey=$_apiKey")
        .then((dynamic res) {
      _data = res['articles'];
      return _data.map((obj) => new Article.map(obj)).toList();
    });
  }

  Future<List<Article>> fetchTopHeadlinesByCategory(var country,var category) {
    return _request(
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$_apiKey")
        .then((dynamic res) {
      _data = res['articles'];
      print(_data);
      return _data.map((obj) => new Article.map(obj)).toList();
    });
  }

}
