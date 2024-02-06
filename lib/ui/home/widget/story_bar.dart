import 'package:flutter/material.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/data/model/story_view_model.dart';
import 'package:social_media/ui/home/widget/story_card.dart';

class StoryBar extends StatelessWidget {
  const StoryBar({
    required this.story,
    super.key,
  });

  final List<StoryViewModel> story;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: StaticSize.storyBarHeight,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: StaticSize.paddingLarge),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => StoryCard(story: story[index]),
        separatorBuilder: (context, index) => SizedBox(
          width: StaticSize.paddingLarge,
        ),
        itemCount: story.length,
      ),
    );
  }
}
