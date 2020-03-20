import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:storytest/bloc/bloc.dart';
import 'package:storytest/model/detail_story.dart';

import 'bloc/story_repository.dart';
class DetailStoryPage extends StatelessWidget {
  var text;

  DetailStoryPage({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StoryBloc(storyRepository: StoryRepository()),
      child: DetailStoryUi(text: text),
    );
  }
}
class DetailStoryUi extends StatefulWidget {

  var text;

  DetailStoryUi({Key key, @required this.text}) : super(key: key);
  @override
  _DetailStoryUiState createState() => _DetailStoryUiState();
}

class _DetailStoryUiState extends State<DetailStoryUi> {

  StoryBloc _storyBloc;

  @override
  void initState() {
    _storyBloc = BlocProvider.of<StoryBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _storyBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Story"),
      ),
      body: BlocBuilder(
        bloc: _storyBloc,
        builder: (context, state){

          DetailStory det = DetailStory.fromJson(widget.text);

          if(state is InitialStoryState){
            if(det.kids==null){
              _storyBloc.add(getCommentEvent(list: null));
              print("send null");
            }
            else{
              _storyBloc.add(getCommentEvent(list: det.kids));
              print("send banyak");
            }
            return Center(
              child: CircularProgressIndicator(),
            );

          }else if (state is getListDataState){
            List<DetailStory> list = state.list;
            print("ini list"+list.toString());

            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(det.title, textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    Text("By : ${det.by}"),
                    SizedBox(height: 10,),
                    (det.text==null)? Text("Tidak Ada Deskripsi"): Html(data: det.text,),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: list.length,
                        // ignore: missing_return
                        itemBuilder: (context, index) {
                          DetailStory det = list[index];
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: ListTile(
                              title: Html(data: det.text,),
                            ),
                          );
                        },
                      ),

                  ],
                ),
              ),
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

