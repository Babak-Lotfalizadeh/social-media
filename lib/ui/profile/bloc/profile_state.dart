import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/data/model/post_view_model.dart';
import 'package:social_media/data/model/user_view_model.dart';

class ProfileState {}

class ProfileStateInit extends ProfileState {}

class ProfileStateLoaded extends ProfileState {
  final User? user;
  final Stream<UserViewModel?> userViewModel;
  final Stream<List<PostViewModel>> post;

  ProfileStateLoaded({
    required this.user,
    required this.post,
    required this.userViewModel,
  });
}
