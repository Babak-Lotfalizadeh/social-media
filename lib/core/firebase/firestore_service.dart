import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  late FirebaseFirestore db = FirebaseFirestore.instance;

  FireStoreService.setup();

  void getPosts() async {
    await db.collection("posts").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }

}