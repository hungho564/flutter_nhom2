import 'dart:convert';
import 'package:flutter_nhom2/model/article.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  static const String apiKey = "0980128c270c456f82b415626685dcbf";

  static Future<List<Article>> fetchArticles() async {
    final url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List articles = data["articles"];

      return articles.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }
}
