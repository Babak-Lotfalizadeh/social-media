import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/data/model/post_view_model.dart';
import 'package:social_media/data/model/story_view_model.dart';

class FireStoreService {
  late FirebaseFirestore db = FirebaseFirestore.instance;

  FireStoreService.setup();

  Stream<List<PostViewModel>> getPosts() {
    final querySnapshot = db
        .collection("posts")
        .orderBy(
          'date',
          descending: true,
        )
        .snapshots();
    return querySnapshot.map((event) {
      final result = List.generate(event.size, (index) {
        final item = event.docs[index];
        return PostViewModel.fromJson(item.data());
      });
      return result;
    });
  }

  Stream<List<StoryViewModel>> getStory() {
    final querySnapshot = db.collection("stores").orderBy('seen').snapshots();
    return querySnapshot.map((event) {
      final result = List.generate(event.size, (index) {
        final item = event.docs[index];
        final result = StoryViewModel.fromJson(item.data());
        result.setId(item.id);
        return result;
      });
      return result;
    });
  }

  Future<void> markStoryAsSeen(StoryViewModel storyViewModel) async {
    final story = db.collection("stores").doc(storyViewModel.id);
    storyViewModel.setSeen(true);
    story.set(storyViewModel.toJson());
  }
}
