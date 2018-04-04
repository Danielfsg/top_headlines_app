import 'package:flutter/material.dart';
import 'package:top_headlines_app/model/article.dart';

const List<String> category = const [
  "business",
  "entertainment",
  "general",
  "health",
  "science",
  "sports",
  "technology"
];

const Map<String, String> country = const {
  "pt": "Portugal",
  "gb": "United Kingdom",
  "us": "United States"
};

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Settings', icon: Icons.settings),
  const Choice(title: 'About', icon: Icons.info),
];
