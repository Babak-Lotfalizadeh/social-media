import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/data/model/story_view_model.dart';
import 'package:social_media/ui/story/bloc/story_bloc.dart';
import 'package:social_media/ui/story/bloc/story_event.dart';
import 'package:social_media/ui/story/story_preview.dart';
import 'package:social_media/utils/context_extension.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.story,
  });

  final StoryViewModel? story;

  @override
  Widget build(BuildContext context) {
    if (story == null) return const SizedBox.shrink();

    return SizedBox(
      width: StaticSize.userStory,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.read<StoryBloc>().add(
                    StoryEventPreview(
                      storyViewModel: story!,
                    ),
                  );
              context.push(StoryPreview());
            },
            child: Container(
              width: StaticSize.userStory,
              height: StaticSize.userStory,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: story?.seen == true ? 0 : StaticSize.paddingSmall,
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(800)),
                child: Image.network(
                  story!.user?.userImage ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: StaticSize.paddingSmall),
          Expanded(
            child: Text(
              story!.user?.userName ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
