import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/di/di_service.dart';
import 'package:social_media/core/firebase/firebase_auth_service.dart';
import 'package:social_media/core/firebase/firestore_service.dart';
import 'package:social_media/ui/profile/bloc/profile_event.dart';
import 'package:social_media/ui/profile/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(super.initialState) {
    on<ProfileEventGetData>(_getData);
    on<ProfileEventDeletePost>(_deletePost);
  }

  Future<void> _getData(
    ProfileEventGetData event,
    Emitter<ProfileState> emit,
  ) async {
    final user = getIt<FirebaseAuthService>().user;
    final userViewModel = getIt<FireStoreService>().getMyInformation(
      user?.email,
    );
    final posts = getIt<FireStoreService>().getMyPosts(user?.email);

    emit(ProfileStateLoaded(
      user: user,
      userViewModel: userViewModel,
      post: posts,
    ));
  }

  Future<void> _deletePost(
    ProfileEventDeletePost event,
    Emitter<ProfileState> emit,
  ) async {
    getIt<FireStoreService>().deletePost(event.postViewModel);
  }
}
