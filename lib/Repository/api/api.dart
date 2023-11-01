import 'dart:convert';


import 'package:http/http.dart';


import '../modelclass/MovieModel.dart';
import 'api_client.dart';




class MovieApi {
  ApiClient apiClient = ApiClient();


  Future<MovieModel> getMovie() async {
    String trendingpath = 'https://ott-details.p.rapidapi.com/advancedsearch';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return MovieModel.fromJson(jsonDecode(response.body));
  }
}