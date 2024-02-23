import 'package:social_media/data/model/story_item_view_model.dart';
import 'package:social_media/data/model/story_view_model.dart';

class StoryEvent {}

class StoryEventGetData extends StoryEvent {}

class StoryEventPreview extends StoryEvent {
  final StoryViewModel storyViewModel;

  StoryEventPreview({
    required this.storyViewModel,
  });
}

class StoryEventSeen extends StoryEvent {
  final StoryViewModel? story;
  final StoryItemViewModel? storyItem;
  final bool markStoryAsSeen;

  StoryEventSeen({
    required this.story,
    required this.storyItem,
    required this.markStoryAsSeen,
  });
}
