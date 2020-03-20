import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storytest/bloc/bloc.dart';
import 'package:storytest/bloc/story_repository.dart';

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
class StoryUi extends StatelessWidget {

  String title = "Sedang Mengambil Data....";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder(
        builder: (context, state){
          return Container();
        },
      ),
    );
  }
}

