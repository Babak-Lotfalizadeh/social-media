import 'package:flutter/material.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/data/model/post_view_model.dart';
import 'package:social_media/ui/home/widget/post_card.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    required this.posts,
    required this.showSetting,
    super.key,
  });

  final List<PostViewModel?>? posts;
  final bool showSetting;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: posts?.length ?? 0,
      itemBuilder: (context, index) => PostCard(
        post: posts?[index],
        showSetting: showSetting,
      ),
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: StaticSize.paddingNormal),
        child: const Divider(),
      ),
    );
  }
}
