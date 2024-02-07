import 'package:flutter/material.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/data/model/story_view_model.dart';
import 'package:social_media/ui/home/widget/story_card.dart';

class StoryBarLoadedWidget extends StatelessWidget {
  const StoryBarLoadedWidget({
    required this.story,
    super.key,
  });

  final Stream<List<StoryViewModel>> story;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: story,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const SizedBox.shrink();
        }

        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: StaticSize.paddingLarge),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => StoryCard(
            story: snapshot.data![index],
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: StaticSize.paddingLarge,
          ),
          itemCount: snapshot.data!.length,
        );
      },
    );
  }
}
