import 'package:flutter/material.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/data/model/story_view_model.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.story,
  });

  final StoryViewModel story;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: StaticSize.userStory,
      child: Column(
        children: [
          Container(
            width: StaticSize.userStory,
            height: StaticSize.userStory,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: story.seen ? 0 : StaticSize.paddingSmall,
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(800)),
              child: Image.network(
                story.userImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: StaticSize.paddingSmall),
          Expanded(
            child: Text(
              story.userName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
