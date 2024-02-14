import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:social_media/core/di/di_service.dart';
import 'package:social_media/core/firebase/firestore_service.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(super.initialState) {
    on<HomeEventGetData>(_getData);
    on<HomeEventLikeAPost>(_likeAPost);
    on<HomeEventShareAPost>(_shareAPost);
  }

  Future<void> _getData(
    HomeEventGetData event,
    Emitter<HomeState> emit,
  ) async {
    var posts = GetIt.instance<FireStoreService>().getPosts();

    emit(
      HomeStateLoaded(
        posts: posts,
      ),
    );
  }

  Future<void> _likeAPost(
    HomeEventLikeAPost event,
    Emitter<HomeState> emit,
  ) async {
    getIt<FireStoreService>().toggleLikeButton(event.postViewModel);
  }

  Future<void> _shareAPost(
    HomeEventShareAPost event,
    Emitter<HomeState> emit,
  ) async {
  }
}
