import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/data/model/post_view_model.dart';
import 'package:social_media/data/model/story_view_model.dart';
import 'package:social_media/data/model/user_view_model.dart';

class FireStoreService {
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
    final querySnapshot = _db.collection("stores").orderBy('seen').snapshots();
    return querySnapshot.map((event) {
      final result = List.generate(event.size, (index) {
        final item = event.docs[index];
        final result = StoryViewModel.fromJson(item.data());
        result.setId(item.id);
        result.setUser(_users);
        return result;
      });
      return result;
    });
  }

  Future<void> markStoryAsSeen(StoryViewModel storyViewModel) async {
    final story = _db.collection("stores").doc(storyViewModel.id);
    storyViewModel.setSeen(true);
    story.set(storyViewModel.toJson());
  }
}
