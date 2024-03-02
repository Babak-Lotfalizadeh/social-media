import 'dart:io';

import 'package:social_media/utils/post_type.dart';

class AddPostEvent {}

class AddPostEventCreateAPost extends AddPostEvent {
  final File file;
  final String description;
  final PostType postType;

  AddPostEventCreateAPost({
    required this.file,
    required this.description,
    required this.postType,
  });
}
