import 'package:equatable/equatable.dart';
import 'package:storytest/model/detail_story.dart';

abstract class StoryState extends Equatable {
  const StoryState();
}

class InitialStoryState extends StoryState {
  @override
  List<Object> get props => [];
}

class getListDataState extends StoryState{

  List<DetailStory> list;
  getListDataState({this.list});

  @override
  List<Object> get props => [list];

}

class errorDataState extends StoryState{
  String error;

  errorDataState({this.error});
  @override
  List<Object> get props => [error];

}
