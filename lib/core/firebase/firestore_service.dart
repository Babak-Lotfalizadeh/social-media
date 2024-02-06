import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/data/model/post_view_model.dart';

class FireStoreService {
  late FirebaseFirestore db = FirebaseFirestore.instance;

  FireStoreService.setup();

  Future<List<PostViewModel>> getPosts() async {
    final querySnapshot = await db.collection("posts").get();
    final result = List.generate(querySnapshot.size, (index) {
      final item = querySnapshot.docs[index];
      return PostViewModel.fromJson(item.data());
    });
    return result;
  }
}
