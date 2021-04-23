import 'dart:convert';

import 'package:covid19_app/Models/ArticleModel.dart';
import 'package:http/http.dart' as http;

class Haberler {
  List<articleModel> haber = [];

  Future<void> getNews() async {
    String _url =
        "https://newsapi.org/v2/top-headlines?country=tr&apiKey=f4dd55f58d2b428e996771ba8992596a";

    final Uri _uri = Uri.parse(_url);
    var response = await http.get(_uri);

    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status'] == 'ok') {
      jsonResponse["articles"].forEach((item) {
        if (item["urlToImage"] != null && item["description"] != null) {
          articleModel articles = new articleModel(
            url: item["url"],
            author: item["author"],
            description: item["description"],
            title: item["title"],
            content: item["content"],
            imageToUrl: item["urlToImage"],
          );
          haber.add(articles);
        }
      });
    }
  }
}

class Categories {
  List<articleModel> haber = [];

  Future<void> getCtegoryNews(String Category) async {
    String _url =
        "https://newsapi.org/v2/top-headlines?category=$Category&country=tr&apiKey=f4dd55f58d2b428e996771ba8992596a";

    final Uri _uri = Uri.parse(_url);
    var response = await http.get(_uri);

    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status'] == 'ok') {
      jsonResponse["articles"].forEach((item) {
        if (item["urlToImage"] != null && item["description"] != null) {
          articleModel articles = new articleModel(
            url: item["url"],
            author: item["author"],
            description: item["description"],
            title: item["title"],
            content: item["content"],
            imageToUrl: item["urlToImage"],
          );
          haber.add(articles);
        }
      });
    }
  }
}
