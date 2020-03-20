import 'package:equatable/equatable.dart';

abstract class StoryEvent extends Equatable {
  const StoryEvent();
}

class getListDataEvent extends StoryEvent{

  @override
  List<Object> get props => null;

}
class getCommentEvent extends StoryEvent{

  List<int> list;

  getCommentEvent({this.list});

  @override
  // TODO: implement props
  List<Object> get props =>[list];

}
