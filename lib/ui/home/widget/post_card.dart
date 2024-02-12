import 'package:flutter/material.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/data/model/post_view_model.dart';
import 'package:social_media/ui/home/widget/post_icon.dart';
import 'package:social_media/ui/home/widget/user_image.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    required this.post,
    super.key,
  });

  final PostViewModel? post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: StaticSize.paddingLarge,
            ),
            child: Row(
              children: [
                if (post?.userImage != null)
                  UserImage(
                    imageAddress: post?.userImage ?? '',
                  ),
                SizedBox(width: StaticSize.paddingNormal),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post?.userName ?? ''),
                    Opacity(
                      opacity: 0.7,
                      child: Text(post?.location ?? ''),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: StaticSize.paddingNormal),
          if (post?.image != null)
            Expanded(
              child: Image.network(
                post?.image ?? '',
                fit: BoxFit.cover,
              ),
            ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                PostIcon(
                  onPressed: () {},
                  iconData: Icons.favorite,
                ),
                PostIcon(
                  onPressed: () {},
                  iconData: Icons.comment,
                ),
                PostIcon(
                  onPressed: () {},
                  iconData: Icons.share,
                ),
                const Spacer(),
                PostIcon(
                  onPressed: () {},
                  iconData: Icons.bookmark,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: StaticSize.paddingLarge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${post?.like ?? 0} Likes'),
                Text(post?.description ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
