import 'package:flutter/material.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/ui/app_bar/my_app_bar.dart';
import 'package:social_media/ui/home/widget/home_content.dart';
import 'package:social_media/ui/story/story_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: CustomScrollView(
        slivers: [
          const StoryBar(),
          SliverToBoxAdapter(child: SizedBox(height: StaticSize.paddingLarge)),
          const HomeContent(),
        ],
      ),
    );
  }
}
