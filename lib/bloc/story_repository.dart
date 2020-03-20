import 'package:dio/dio.dart';
import 'package:storytest/model/detail_story.dart';
import 'package:storytest/request/request_api.dart';

class StoryRepository {

  Future<List<int>> getListStorys() async{
    final dio = Dio();
    final client = RestClient(dio);
    return await client.getListStory();
  }

  Future<DetailStory> getDetailStory(String ids) async {
    final dio = Dio();
    final client = RestClient(dio);
    var data = await client.getDetailStory(ids);
    return data;
  }
}
