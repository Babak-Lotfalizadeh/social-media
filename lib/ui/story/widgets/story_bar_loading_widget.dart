import 'package:flutter/material.dart';

class StoryBarLoadingWidget extends StatelessWidget {
  const StoryBarLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
