import 'package:social_media/data/model/post_view_model.dart';

class ProfileEvent {}

class ProfileEventGetData extends ProfileEvent {}

class ProfileEventDeletePost extends ProfileEvent {
  final PostViewModel? postViewModel;

  ProfileEventDeletePost({required this.postViewModel});
}