import 'package:flutter/material.dart';
import 'package:social_media/ui/app_bar/my_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
    );
  }
}
