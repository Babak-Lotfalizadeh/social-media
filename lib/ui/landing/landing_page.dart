import 'package:flutter/material.dart';
import 'package:social_media/ui/landing/landing_content.dart';

import '../bottom_navigation_bar/my_bottom_navigation_bar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LandingContent(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
