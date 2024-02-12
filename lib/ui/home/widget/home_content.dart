import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/ui/home/bloc/home_bloc.dart';
import 'package:social_media/ui/home/bloc/home_event.dart';
import 'package:social_media/ui/home/bloc/home_state.dart';
import 'package:social_media/ui/home/widget/post_card.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({
    super.key,
  });

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeEventGetData());
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeStateLoaded) {
          return StreamBuilder(
            stream: state.posts,
            builder: (context, snapshot) {
              if(snapshot.hasData && snapshot.data != null){
                return SliverList.separated(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) => PostCard(
                    post: snapshot.data?[index],
                  ),
                  separatorBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: StaticSize.paddingNormal),
                    child: const Divider(),
                  ),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
