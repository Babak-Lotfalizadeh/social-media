import 'package:flutter/material.dart';
import 'package:social_media/data/model/post_view_model.dart';
import 'package:social_media/ui/app_bar/my_app_bar.dart';
import 'package:social_media/ui/home/widget/home_content.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key, required this.posts});

  final List<PostViewModel?>? posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        showAppIcon: false,
        title: 'Posts',
      ),
      body: CustomScrollView(
        slivers: [
          HomeContent(
            posts: posts,
            showSetting: true,
          ),
        ],
      ),
    );
  }
}
