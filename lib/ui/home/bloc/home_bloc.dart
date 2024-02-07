import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:social_media/core/firebase/firestore_service.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(super.initialState) {
    on<HomeEventGetData>(_getData);
  }

  Future<void> _getData(
    HomeEventGetData event,
    Emitter<HomeState> emit,
  ) async {
    var posts = await GetIt.instance<FireStoreService>().getPosts();

    emit(
      HomeStateLoaded(
        posts: posts,
      ),
    );
  }
}
