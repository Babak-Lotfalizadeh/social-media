import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/ui/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';
import 'package:social_media/ui/bottom_navigation_bar/bloc/bottom_navigation_state.dart';
import 'package:social_media/ui/landing/landing_content.dart';

import '../bottom_navigation_bar/my_bottom_navigation_bar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationBloc>(
      create: (context) => BottomNavigationBloc(
        BottomNavigationState(value: 0),
      ),
      child: const Scaffold(
        body: LandingContent(),
        bottomNavigationBar: MyBottomNavigationBar(),
      ),
    );
  }
}
