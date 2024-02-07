import 'package:social_media/data/model/story_view_model.dart';

class StoryEvent {}

class StoryEventPreview extends StoryEvent {
  final StoryViewModel storyViewModel;

  StoryEventPreview({
    required this.storyViewModel,
  });
}
