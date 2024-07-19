import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/newsResponse/NewsResponse.dart';
import 'package:news_app/model/sourcesResponse/SourcesResponse.dart';
class ApiManager{
  static const String baseUrl = "newsapi.org" ;
  static const String apiKey = "b91c352ffd044352bdbba7de31d67547" ;
  static Future<SourcesResponse>getSources(String categoryId)async{
   var uri = Uri.https(baseUrl,"v2/top-headlines/sources",{
      "apiKey":apiKey,
      "category":categoryId
    },);
   var response = await http.get(uri);
   var json = jsonDecode(response.body);
   var sourcesResponse = SourcesResponse.fromJson(json);
   return sourcesResponse;
  }
  static Future<NewsResponse>getNews(String? sourceId)async{
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=b91c352ffd044352bdbba7de31d67547
    var url = Uri.https(baseUrl,"v2/everything",{
      "apiKey":apiKey,
      "sources":sourceId
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}