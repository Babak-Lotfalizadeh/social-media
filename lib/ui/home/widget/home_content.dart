import 'package:flutter/material.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/data/model/post_view_model.dart';
import 'package:social_media/ui/home/widget/post_card.dart';
import 'package:social_media/ui/story/story_bar.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    required this.posts,
    super.key,
  });

  final List<PostViewModel> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: StaticSize.paddingLarge),
      itemBuilder: (context, index) {
        if (index == 0) {
          return const StoryBar();
        }

        return PostCard(
          post: posts[index - 1],
        );
      },
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: StaticSize.paddingNormal),
        child: index == 0 ? const SizedBox.shrink() : const Divider(),
      ),
      itemCount: posts.length + 1,
    );
  }
}
