import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app_flutter/model/news_model.dart';
import 'package:news_app_flutter/util/variables.dart';

class ApiService {
  final String BASE_URL = "https://newsapi.org/v2/";
  String API_KEY = "d591e82bd8844e8992f7875e27791f29";
  String language = Variables().language;

  Future<NewsModel?> fetchTopHeadlines() async {
    // language kısmı ayarlardan değiştirilebilir
    String url = BASE_URL +
        "top-headlines?apiKey=$API_KEY&language=" +
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
}
