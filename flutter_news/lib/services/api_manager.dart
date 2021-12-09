import 'dart:convert';

import 'package:flutter_news/constants/strings.dart';
import 'package:flutter_news/models/news_model.dart';
import 'package:flutter_news/models/users.dart';
import 'package:http/http.dart' as http;

class APIManager {
  // var url =
  //     "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=847e0170dc454cc99cd7558171a3bff1";

  Future<NewsModel?> getNews() async {
    var client = http.Client();
    var newsModel = null;
    try {
      var response = await client.get(Uri.parse(Strings.news_url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        // print(response.body);
        var jsonMap = json.decode(jsonString);
        // print(jsonMap);
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }

  static Future<List<User>> getUsers() async {
    // List<Users> users = [];
    try {
      final response = await http.get(Uri.parse(Strings.url_updated_user));
      if (response.statusCode == 200) {
        var jsonStringg = response.body;
        List<User> users = usersFromJson(jsonStringg) as List<User>;
        return users;
        print(users);
      }
    } catch (e) {
      throw Exception('Failed to load');
    }
    return <User>[];
  }
}
