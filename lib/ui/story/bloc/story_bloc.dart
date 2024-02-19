import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/di/di_service.dart';
import 'package:social_media/core/firebase/firestore_service.dart';

import 'story_event.dart';
import 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  StoryBloc(super.initialState) {
    on<StoryEventGetData>(_getData);
    on<StoryEventPreview>(_storyPreview);
  }

  Future<void> _getData(
    StoryEventGetData event,
    Emitter<StoryState> emit,
  ) async {
    if (state is StoryStateLoaded) return;
    var storyStream = getIt<FireStoreService>().getStory();
    emit(
      StoryStateLoaded(story: storyStream),
    );
  }

  Future<void> _storyPreview(
    StoryEventPreview event,
    Emitter<StoryState> emit,
  ) async {
    final storyItems = getIt<FireStoreService>().getStoryItems(
      event.storyViewModel,
    );

    if(state is StoryStateLoaded) {
      emit(
        StoryStateLoaded(
          story: (state as StoryStateLoaded).story,
          items: storyItems,
        ),
      );
    }
  }
}
