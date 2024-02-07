import 'package:flutter/material.dart';

class StoryBarFailWidget extends StatelessWidget {
  const StoryBarFailWidget({
    required this.error,
    super.key,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error));
  }
}
