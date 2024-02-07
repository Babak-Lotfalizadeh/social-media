import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/ui/story/bloc/story_bloc.dart';
import 'package:social_media/ui/story/bloc/story_event.dart';
import 'package:social_media/ui/story/bloc/story_state.dart';
import 'package:social_media/ui/story/widgets/story_bar_fail_widget.dart';
import 'package:social_media/ui/story/widgets/story_bar_loaded_widget.dart';
import 'package:social_media/ui/story/widgets/story_bar_loading_widget.dart';

class StoryBar extends StatefulWidget {
  const StoryBar({super.key});

  @override
  State<StoryBar> createState() => _StoryBarState();
}

class _StoryBarState extends State<StoryBar> {
  @override
  void initState() {
    context.read<StoryBloc>().add(StoryEventGetData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: StaticSize.storyBarHeight,
      child: BlocBuilder<StoryBloc, StoryState>(
        builder: (context, state) {
          if (state is StoryStateLoaded) {
            return StoryBarLoadedWidget(story: state.story);
          } else if (state is StoryStateLoading) {
            return const StoryBarLoadingWidget();
          } else if (state is StoryStateFail) {
            return StoryBarFailWidget(error: state.error);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
