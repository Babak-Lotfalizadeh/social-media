import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final _storage = FirebaseStorage.instance.ref();

  FirebaseStorageService.setup();

  Future<String> uploadImage(File file) async {
    final ref = _storage.child('post/${DateTime.now()}.jpg');
    final task = await ref.putFile(file);
    return task.ref.getDownloadURL();
  }
}
