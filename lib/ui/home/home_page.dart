import 'package:flutter/material.dart';

import 'my_app_bar.dart';
import '../bottom_navigation_bar/my_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
