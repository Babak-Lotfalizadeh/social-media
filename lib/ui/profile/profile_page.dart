import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/ui/app_bar/my_sliver_app_bar.dart';
import 'package:social_media/ui/profile/bloc/profile_bloc.dart';
import 'package:social_media/ui/profile/bloc/profile_state.dart';
import 'package:social_media/ui/profile/profile_page_container.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const MySliverAppBar(
              showAdd: true,
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileStateInit) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ProfileStateLoaded) {
                    return ProfilePageContainer(
                      user: state.user,
                      posts: state.post,
                      userViewModel: state.userViewModel,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
