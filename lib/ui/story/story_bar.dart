import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/ui/story/bloc/story_bloc.dart';
import 'package:social_media/ui/story/bloc/story_state.dart';
import 'package:social_media/ui/story/widgets/story_bar_fail_widget.dart';
import 'package:social_media/ui/story/widgets/story_bar_loaded_widget.dart';
import 'package:social_media/ui/story/widgets/story_bar_loading_widget.dart';

class StoryBar extends StatelessWidget {
  const StoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        height: StaticSize.storyBarHeight,
        child: BlocBuilder<StoryBloc, StoryState>(
          builder: (context, state) {
            if (state is StoryStateLoaded) {
              return StreamBuilder(
                stream: state.story,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return StoryBarLoadedWidget(story: snapshot.data);
                  }

                  return const SizedBox.shrink();
                },
              );
            } else if (state is StoryStateLoading) {
              return const StoryBarLoadingWidget();
            } else if (state is StoryStateFail) {
              return StoryBarFailWidget(error: state.error);
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
