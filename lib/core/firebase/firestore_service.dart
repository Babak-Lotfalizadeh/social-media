import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/data/model/post_view_model.dart';
import 'package:social_media/data/model/story_item_view_model.dart';
import 'package:social_media/data/model/story_view_model.dart';
import 'package:social_media/data/model/user_view_model.dart';

class FireStoreService {
  late final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<UserViewModel>? _users;

  List<UserViewModel>? get users => _users;

  FireStoreService.setup();

  Future<void> getInitialData() async {
    await Future.wait([getUsers()]);
  }

  Stream<UserViewModel?> getMyInformation(String? myId) {
    final snapshots = _db.collection('users').doc(myId).snapshots();
    return snapshots.map((event) {
      if (event.data() == null) return null;
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

  Stream<List<StoryViewModel>> getStory() {
    return _db
        .collection("stores")
        .withConverter<StoryViewModel>(
          fromFirestore: (snapshot, _) =>
              StoryViewModel.fromFirestore(snapshot, _users),
          toFirestore: (value, options) => value.toFirestore(),
        )
        .snapshots()
        .map((event) {
      return List.generate(event.size, (index) => event.docs[index].data());
    });
  }

  Stream<List<StoryItemViewModel>> getStoryItems(
    StoryViewModel storyViewModel,
  ) {
    return _db
        .collection("stores")
        .doc(storyViewModel.id)
        .collection('items')
        .withConverter<StoryItemViewModel>(
          fromFirestore: (snapshot, _) =>
              StoryItemViewModel.fromFirestore(snapshot),
          toFirestore: (value, options) => value.toFirestore(),
        )
        .snapshots()
        .map((event) {
      return List.generate(event.size, (index) => event.docs[index].data());
    });
  }

  Future<void> markStoryAsSeen({
    required StoryViewModel? storyViewModel,
  }) async {
    if (storyViewModel == null) return;
    final story = _db.collection("stores").doc(storyViewModel.id);

    storyViewModel.setSeen(true);
    story.set(storyViewModel.toFirestore());
  }

  Future<void> markItemStoryAsSeen({
    required StoryItemViewModel? storyItemViewModel,
    required StoryViewModel? storyViewModel,
  }) async {
    if (storyItemViewModel == null) return;
    final story = _db
        .collection("stores")
        .doc(storyViewModel?.id)
        .collection('items')
        .doc(storyItemViewModel.id);

    storyItemViewModel.setSeen(true);
    story.set(storyItemViewModel.toFirestore());
  }

  void toggleLikeButton(PostViewModel? postViewModel) {
    if (postViewModel == null) return;
    final post = _db.collection("posts").doc(postViewModel.id);
    postViewModel.toggleLikeButton();
    post.set(postViewModel.toJson());
  }

  Future<void> newPost(PostViewModel postViewModel) async {
    final post = _db.collection("posts");
    await post.add(postViewModel.toJson());
  }

  Future<void> newStory({
    required StoryViewModel storyViewModel,
    required StoryItemViewModel storyItemViewModel,
  }) async {
    final storyCollection = _db.collection("stores");
    final storyDoc = await storyCollection
        .where(
          'userId',
          isEqualTo: storyViewModel.userId,
        )
        .get();

    _db
        .collection("stores")
        .doc(storyDoc.docs.first.id).set(
        storyViewModel.toFirestore()
    );

    _db
        .collection("stores")
        .doc(storyDoc.docs.first.id)
        .collection('items')
        .add(storyItemViewModel.toFirestore());
  }

  Future<void> deletePost(PostViewModel? postViewModel) async {
    await  _db.collection("posts").doc(postViewModel?.id).delete();
  }
}
