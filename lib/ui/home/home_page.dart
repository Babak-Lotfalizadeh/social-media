import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/ui/app_bar/my_app_bar.dart';
import 'package:social_media/ui/home/bloc/home_bloc.dart';
import 'package:social_media/ui/home/bloc/home_state.dart';
import 'package:social_media/ui/home/widget/home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: BlocBuilder<HomeBloc,HomeState>(
        builder: (context, state) {
          if(state is HomeStateLoaded){
            return HomeContent(posts: state.posts);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
