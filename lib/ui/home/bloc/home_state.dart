import 'package:social_media/data/model/post_view_model.dart';

class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateFail extends HomeState {
  String error;

  HomeStateFail({required this.error});
}

class HomeStateLoaded extends HomeState {
  final Stream<List<PostViewModel>> posts;

  HomeStateLoaded({
    required this.posts,
  });
}
