import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/di/di_service.dart';
import 'package:social_media/core/firebase/firebase_auth_service.dart';
import 'package:social_media/core/firebase/firebase_storage_service.dart';
import 'package:social_media/core/firebase/firestore_service.dart';
import 'package:social_media/data/model/post_view_model.dart';
import 'package:social_media/data/model/story_item_view_model.dart';
import 'package:social_media/data/model/story_view_model.dart';
import 'package:social_media/ui/add_post/bloc/add_post_event.dart';
import 'package:social_media/ui/add_post/bloc/add_post_state.dart';
import 'package:social_media/utils/post_type.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
  AddPostBloc(super.initialState) {
    on<AddPostEventCreateAPost>(_createPost);
  }

  Future<void> _createPost(
    AddPostEventCreateAPost event,
    Emitter<AddPostState> emit,
  ) async {
    final userId = getIt<FirebaseAuthService>().user?.email;
    final date = DateTime.now();
    final description = event.description;
    const location = 'random';
    final image = await getIt<FirebaseStorageService>().uploadImage(event.file);

    switch (event.postType) {
      case PostType.post:
        final postViewModel = PostViewModel(
          userId: userId ?? '',
          description: description,
          image: image,
          date: date,
          location: location,
          like: [],
        );

        await getIt<FireStoreService>().newPost(postViewModel);
      case PostType.story:
        final storyViewModel = StoryViewModel.create(
          userId: userId ?? '',
        );

        final storyItemViewModel = StoryItemViewModel.create(image: image);

        await getIt<FireStoreService>().newStory(
          storyItemViewModel: storyItemViewModel,
          storyViewModel: storyViewModel,
        );
    }
  }
}
