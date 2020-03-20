import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:storytest/bloc/story_repository.dart';
import 'package:storytest/model/detail_story.dart';

import './bloc.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  StoryRepository storyRepository;
  List<DetailStory> list = [];
  List<DetailStory> comment_list = [];
  @override
  StoryState get initialState => InitialStoryState();

  StoryBloc({this.storyRepository});

  @override
  Stream<StoryState> mapEventToState(
    StoryEvent event,
  ) async* {
    if(event is getListDataEvent){
      try{
        List<int> list_int = await storyRepository.getListStorys();
        if(list.length == 0) {
          list_int.forEach((value) async {
            DetailStory detailStory = await storyRepository.getDetailStory(
                value.toString());

            list.add(detailStory);
          });
        }else{

          yield getListDataState(list: list);
        }
      }
      catch(_){
        yield errorDataState(error: "error");
      }
    }else if (event is getCommentEvent){

      if(comment_list.length == 0) {
        event.list.forEach((value) async {
          DetailStory detailStory = await storyRepository.getDetailStory(
              value.toString());
          comment_list.add(detailStory);
        });
      }else{
        yield getListDataState(list: comment_list);
      }
    }
  }
}
