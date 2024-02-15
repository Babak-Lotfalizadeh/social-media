import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/data/model/post_view_model.dart';
import 'package:social_media/data/model/story_view_model.dart';
import 'package:social_media/data/model/user_view_model.dart';

class FireStoreService {
  final _storySteamController = StreamController<List<StoryViewModel>>();
  late final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<UserViewModel>? _users;

  Stream<List<StoryViewModel>> get storyStream =>
      _storySteamController.stream.asBroadcastStream();

  List<UserViewModel>? get users => _users;

  FireStoreService.setup();

  Future<void> getInitialData() async {
    await Future.wait([getUsers()]);
    _getStory();
  }

  Stream<UserViewModel?> getMyInformation(String? myId) {
    final snapshots = _db.collection('users').doc(myId).snapshots();
    return snapshots.map((event) {
      if(event.data() == null) return null;
      return UserViewModel.fromJson(event.data()!);
    });
  }

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

  Stream<List<PostViewModel>> getMyPosts(String? myId) {
    final querySnapshot = _db
        .collection("posts")
        .where('userId', isEqualTo: myId)
        .orderBy('date', descending: true)
        .snapshots();

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

  void toggleLikeButton(PostViewModel? postViewModel) {
    if (postViewModel == null) return;
    final post = _db.collection("posts").doc(postViewModel.id);
    postViewModel.toggleLikeButton();
    post.set(postViewModel.toJson());
  }
}
