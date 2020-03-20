import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:storytest/bloc/story_repository.dart';
import './bloc.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
   StoryRepository storyRepository;
  @override
  StoryState get initialState => InitialStoryState();
StoryBloc({this.storyRepository});
  @override
  Stream<StoryState> mapEventToState(
    StoryEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
