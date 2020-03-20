import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:storytest/model/detail_story.dart';

part 'request_api.g.dart';

@RestApi(baseUrl: "https://hacker-news.firebaseio.com/v0/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET("topstories.json?print=pretty")
  Future<List<int>> getListStory();
  @GET("item/{ids}.json?print=pretty")
  Future<DetailStory> getDetailStory();
}