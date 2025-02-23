import 'package:http/http.dart' as http;

import '../../core/constants/constants.dart';
import '../../core/constants/end_points.dart';

import 'dart:convert';
import 'dart:developer';

import '../models/article_model.dart';
import '../models/source_model.dart';

abstract class ApiNetwork {
  static Future<List<Source>> getAllSources(String categoryID) async {
    try {
      var queryParameters = {
        "apiKey": Constants.apiKEY,
        "category": categoryID,
      };

      var uri = Uri.https(
        Constants.baseURL,
        EndPoints.getAllSources,
        queryParameters,
      );

      var response = await http.get(uri);

      log(response.request.toString());
      log(response.body.toString());

      Map<String, dynamic> data = jsonDecode(response.body);

      SourcesModel sourceModel = SourcesModel.fromJson(data);

      return sourceModel.sources;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
   static Future<List<Article>> getAllArticles(String sourceID) async {
    try {
      var queryParameters = {
        "apiKey": Constants.apiKEY,
        "sources": sourceID,
      };

      var uri = Uri.https(
        Constants.baseURL,
        EndPoints.getAllArticles,
        queryParameters,
      );

      var response = await http.get(uri);

      log(response.request.toString());
      log(response.body.toString());

      Map<String, dynamic> data = jsonDecode(response.body);

      ArticleModel articleModel = ArticleModel.fromJson(data);

      return articleModel.articles;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
