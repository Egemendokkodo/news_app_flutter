import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app_flutter/model/news_model.dart';

class ApiService {
  final String BASE_URL = "https://newsapi.org/v2/";
  String API_KEY = "6ae658bf5324426faf3124e321907649";
  String language =
      "en"; // language kısmı ayarlardan değiştirilebilir kullanıcıya sorarak
  String userCountry =
      "us"; // ülke kısmı ayarlardan değiştirilebilir kullanıcıya sorarak

  Future<NewsModel?> fetchTopHeadlines() async {
    // language kısmı ayarlardan değiştirilebilir
    String url =
        BASE_URL + "top-headlines?apiKey=$API_KEY&language=" + language;
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonBody = NewsModel.fromJson(jsonDecode(response.body));
      return jsonBody;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }

  Future<NewsModel?> fetchNewsByCountry() async {
    String url = BASE_URL +
        "top-headlines?country=$userCountry&apiKey=$API_KEY&language=" +
        language;
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonBody = NewsModel.fromJson(jsonDecode(response.body));
      return jsonBody;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }

  Future<NewsModel?> fetchNewsByCategory(String category) async {
    String url = BASE_URL +
        "top-headlines?country=$userCountry&apiKey=$API_KEY&language=" +
        language +
        "&category=" +
        category;
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonBody = NewsModel.fromJson(jsonDecode(response.body));
      return jsonBody;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }
  Future<NewsModel?> fetchNewsByUserInput(String text) async {
    String url = BASE_URL +
        "everything?apiKey=$API_KEY&language=" +
        language+
        "&q="+text;
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonBody = NewsModel.fromJson(jsonDecode(response.body));
      return jsonBody;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }
}
