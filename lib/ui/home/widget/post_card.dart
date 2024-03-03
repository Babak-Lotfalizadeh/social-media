import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/data/model/post_view_model.dart';
import 'package:social_media/ui/home/bloc/home_bloc.dart';
import 'package:social_media/ui/home/bloc/home_event.dart';
import 'package:social_media/ui/home/widget/post_icon.dart';
import 'package:social_media/ui/home/widget/post_image_widget.dart';
import 'package:social_media/ui/home/widget/user_image.dart';
import 'package:social_media/ui/profile/bloc/profile_bloc.dart';
import 'package:social_media/ui/profile/bloc/profile_event.dart';
import 'package:social_media/utils/context_extension.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    required this.post,
    this.showSetting = false,
    super.key,
  });

  final PostViewModel? post;
  final bool showSetting;

  void _showDeleteDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Are you sure about this?'),
        actions: [
          TextButton(
            onPressed: () {
              context.pop(true);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              context.pop(false);
            },
            child: const Text('No'),
          ),
        ],
      ),
    );

    if (result && context.mounted) {
      context.read<ProfileBloc>().add(
            ProfileEventDeletePost(postViewModel: post),
          );
      context.pop();
    }
  }

  void _showSetting(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.2,
      ),
      builder: (_) => Center(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () {
                context.pop();
                _showDeleteDialog(context);
              },
            )
          ],
        ),
      ),
    );
  }

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
                if (post?.user?.userImage != null)
                  UserImage(
                    imageAddress: post?.user?.userImage ?? '',
                  ),
                SizedBox(width: StaticSize.paddingNormal),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post?.user?.userName ?? ''),
                    Opacity(
                      opacity: 0.7,
                      child: Text(post?.location ?? ''),
                    ),
                  ],
                ),
                const Spacer(),
                Visibility(
                  visible: showSetting,
                  child: IconButton(
                    onPressed: () => _showSetting(context),
                    icon: const Icon(Icons.menu_rounded),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: StaticSize.paddingNormal),
          PostImageWidget(postViewModel: post),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                PostIcon(
                  onPressed: () => context.read<HomeBloc>().add(
                        HomeEventLikeAPost(postViewModel: post),
                      ),
                  iconData: post?.isLikeByMe() == true
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                PostIcon(
                  onPressed: () {},
                  iconData: Icons.comment,
                ),
                PostIcon(
                  onPressed: () => context.read<HomeBloc>().add(
                        HomeEventShareAPost(postViewModel: post),
                      ),
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
                Text('${post?.like.length ?? 0} Likes'),
                Text(post?.description ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
