import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/ui/add_post/add_post_page.dart';
import 'package:social_media/ui/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';
import 'package:social_media/ui/bottom_navigation_bar/bloc/bottom_navigation_state.dart';
import 'package:social_media/ui/home/home_page.dart';
import 'package:social_media/ui/play/play_page.dart';
import 'package:social_media/ui/profile/profile_page.dart';
import 'package:social_media/ui/search/search_page.dart';

class LandingContent extends StatelessWidget {
  const LandingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc,BottomNavigationState>(
      builder: (context, state) {
        switch(state.value){
          case 0: return const HomePage();
          case 1: return const SearchPage();
          case 2: return const AddPostPage();
          case 3: return const PlayPage();
          case 4: return const ProfilePage();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
