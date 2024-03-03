import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/ui/app_bar/my_app_bar.dart';
import 'package:social_media/ui/home/bloc/home_bloc.dart';
import 'package:social_media/ui/home/bloc/home_state.dart';
import 'package:social_media/ui/home/widget/home_content.dart';
import 'package:social_media/ui/story/story_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        showLike: true,
        showMessage: true,
      ),
      body: CustomScrollView(
        slivers: [
          const StoryBar(),
          SliverToBoxAdapter(child: SizedBox(height: StaticSize.paddingLarge)),
          BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state is HomeStateLoaded) {
              return StreamBuilder(
                stream: state.posts,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return HomeContent(
                      posts: snapshot.data,
                      showSetting: false,
                    );
                  }
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
              );
            }
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }),
        ],
      ),
    );
  }
}
