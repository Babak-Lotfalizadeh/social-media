import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/data/model/post_view_model.dart';
import 'package:social_media/data/model/story_view_model.dart';
import 'package:social_media/data/model/user_view_model.dart';

class FireStoreService {
  final _storySteamController = StreamController<List<StoryViewModel>>();
  late final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<UserViewModel>? _users;

  FireStoreService.setup();

  Future<void> getUsers() async {
    final query = await _db.collection('users').get();
    _users = List.generate(
      query.size,
      (index) {
        final result = UserViewModel.fromJson(query.docs[index].data());
        result.setId(query.docs[index].id);
        return result;
      },
    );
  }

  Stream<List<PostViewModel>> getPosts() {
    final querySnapshot =
        _db.collection("posts").orderBy('date', descending: true).snapshots();
    return querySnapshot.map((event) {
      final result = List.generate(event.size, (index) {
        final item = event.docs[index];
        final result = PostViewModel.fromJson(item.data());
        result.setId(item.id);
        result.setUser(_users);
        return result;
      });
      return result;
    });
  }


  Stream<List<StoryViewModel>> getStory() {
    _getStory();
    return _storySteamController.stream;
  }

  void _getStory() {
    final querySnapshot = _db.collection("stores").orderBy('seen').snapshots();
    var storyStream = querySnapshot.map((event) {
      final result = List.generate(event.size, (index) {
        final item = event.docs[index];
        final result = StoryViewModel.fromJson(item.data());
        result.setId(item.id);
        result.setUser(_users);
        return result;
      });
      return result;
    });

    storyStream.listen((event) {
      var result = event
          .map((e) => e.userId)
          .toSet()
          .map((e) => event.firstWhere((element) => element.userId == e))
          .toList();

      _storySteamController.add(result);
    });
  }

  Future<void> markStoryAsSeen(StoryViewModel storyViewModel) async {
    final story = _db.collection("stores").doc(storyViewModel.id);
    storyViewModel.setSeen(true);
    story.set(storyViewModel.toJson());
  }
}
