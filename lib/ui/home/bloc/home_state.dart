import 'package:social_media/data/model/post_view_model.dart';
import 'package:social_media/data/model/story_view_model.dart';

class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateFail extends HomeState {
  String error;

  HomeStateFail({required this.error});
}

class HomeStateLoaded extends HomeState {
  final List<PostViewModel> posts;
  final List<StoryViewModel> story;

  HomeStateLoaded({
    required this.posts,
    required this.story,
  });
}
