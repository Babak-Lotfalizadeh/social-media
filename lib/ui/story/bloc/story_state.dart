import 'package:social_media/data/model/story_item_view_model.dart';
import 'package:social_media/data/model/story_view_model.dart';

class StoryState {}

class StoryStateLoading extends StoryState {}

class StoryStateLoaded extends StoryState {
  final Stream<List<StoryViewModel>> story;
  final Stream<List<StoryItemViewModel>>? items;

  StoryStateLoaded({
    required this.story,
    this.items,
  });
}

class StoryStateFail extends StoryState {
  final String error;

  StoryStateFail({required this.error});
}
