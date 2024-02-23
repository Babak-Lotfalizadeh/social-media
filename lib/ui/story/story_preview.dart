import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/data/model/story_view_model.dart';
import 'package:social_media/ui/story/bloc/story_bloc.dart';
import 'package:social_media/ui/story/bloc/story_state.dart';
import 'package:social_media/ui/story/story_preview_content.dart';

class StoryPreview extends StatelessWidget {
  final StoryViewModel story;

  const StoryPreview({
    super.key,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StoryBloc, StoryState>(
        builder: (context, state) {
          if (state is! StoryStateLoaded) return const SizedBox.shrink();

          return StreamBuilder(
            stream: state.items,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return const SizedBox.shrink();
              return StoryPreviewContent(
                data: snapshot.data,
                story: story,
              );
            },
          );
        },
      ),
    );
  }
}
