import 'package:social_media/data/model/post_view_model.dart';

class HomeEvent {}

class HomeEventGetData extends HomeEvent {}

class HomeEventLikeAPost extends HomeEvent {
  final PostViewModel? postViewModel;

  HomeEventLikeAPost({
    required this.postViewModel,
  });
}

class HomeEventShareAPost extends HomeEvent {
  final PostViewModel? postViewModel;

  HomeEventShareAPost({
    required this.postViewModel,
  });
}
