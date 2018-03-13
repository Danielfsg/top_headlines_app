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
  final String _country = "pt";
  final JsonDecoder _decoder = new JsonDecoder();
  List data;

  Future<dynamic> request(String url) {
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
    return request(
        "https://newsapi.org/v2/top-headlines?country=$_country&apiKey=$_apiKey")
        .then((dynamic res) {
      data = res['articles'];
      return data.map((obj) => new Article.map(obj)).toList();
    });
  }

  Future<List<Article>> fetchTopHeadlinesByCategory(var category) {
    return request(
        "https://newsapi.org/v2/top-headlines?country=$_country&category=$category&apiKey=$_apiKey")
        .then((dynamic res) {
      data = res['articles'];
      return data.map((obj) => new Article.map(obj)).toList();
    });
  }
}
