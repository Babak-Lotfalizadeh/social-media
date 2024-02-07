import 'package:flutter/material.dart';
import 'package:social_media/data/model/story_view_model.dart';
import 'package:social_media/utils/context_extension.dart';

class StoryPreview extends StatelessWidget {
  const StoryPreview({
    required this.story,
    super.key,
  });

  final StoryViewModel story;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => context.pop(),
        child: Image.network(
          story.image,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
