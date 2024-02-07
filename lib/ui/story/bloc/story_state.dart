import 'package:social_media/data/model/story_view_model.dart';

class StoryState {}

class StoryStateLoading extends StoryState {}

class StoryStateLoaded extends StoryState {
  final Stream<List<StoryViewModel>> story;

  StoryStateLoaded({required this.story});
}

class StoryStateFail extends StoryState {
  final String error;

  StoryStateFail({required this.error});
}
