import 'dart:io';

class AddPostEvent {}

class AddPostEventCreateAPost extends AddPostEvent {
  final File file;
  final String description;

  AddPostEventCreateAPost({
    required this.file,
    required this.description,
  });
}
