import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/end_point.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

import 'api_constant.dart';

class ApiManager {
  /*
    https://newsapi.org/v2/top-headlines/sources?apiKey=0456827cba87470e8977438c2895c406
     */
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstant.baseUrl, EndPoints.sourceApi,
        {'apiKey': ApiConstant.apiKey,
        'category' : categoryId});
    try {
      var response = await http.get(url);
      var bodyString = response.body; // String
      var json = jsonDecode(bodyString); // json
      return SourceResponse.fromJson(json); // object
       // SourceResponse.fromJson(jsonDecode(response.body));

      // String => json => object
    } catch (e) {
      throw e;
    }
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=0456827cba87470e8977438c2895c406
   */
static Future<NewsResponse?> getNewsBySourceId(String sourceId)async {
  Uri url = Uri.https(ApiConstant.baseUrl, EndPoints.newsApi,
      {
        'apiKey': ApiConstant.apiKey,
        'sources': sourceId
      }
  );
  try {
    var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return NewsResponse.fromJson(json);
    //NewsResponse.fromJson(jsonDecode(response.body));
  } catch (e) {
    throw e;
  }
}
}
