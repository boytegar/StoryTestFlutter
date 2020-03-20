import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storytest/bloc/bloc.dart';
import 'package:storytest/bloc/story_repository.dart';
import 'package:storytest/detail_story.dart';
import 'package:storytest/model/detail_story.dart';

class StoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StoryBloc(storyRepository: StoryRepository()),
      child: StoryUi(),
    );
  }
}


class StoryUi extends StatefulWidget {
  @override
  _StoryUiState createState() => _StoryUiState();
}

class _StoryUiState extends State<StoryUi> {
  String title = "Top Story";
  StoryBloc _storyBloc;

  @override
  void initState() {
    _storyBloc = BlocProvider.of<StoryBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _storyBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder(
        bloc: _storyBloc,
        builder: (context, state){
          if(state is InitialStoryState){
            _storyBloc.add(getListDataEvent());
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is getListDataState){


            List<DetailStory> data = state.list;
            return Container(
              color: Colors.white10,
              child: ListView.builder(scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  DetailStory detail = data[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: ListTile(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailStoryPage(text: detail.toJson(),),
                                fullscreenDialog: true
                            ));
                      },
                      title: Text("${detail.title}"),
                      trailing: Text("Score ${detail.score}"),

                      subtitle: Text((detail.kids == null) ? "Comment 0" : "Comments ${detail.kids.length}",
                        style: TextStyle(fontSize: 12),),
                    ),
                  );
                },),
            );
          }else{
            return Center(
              child: Text("Error"),
            );
          }

        },
      ),
    );
  }
}




