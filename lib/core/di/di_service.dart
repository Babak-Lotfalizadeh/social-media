import 'package:get_it/get_it.dart';
import 'package:social_media/core/firebase/firebase_auth_service.dart';
import 'package:social_media/core/firebase/firebase_service.dart';
import 'package:social_media/core/firebase/firestore_service.dart';

final getIt = GetIt.instance;

class DIService {
  DIService._();

  static Future<void> setup() async {
    await FirebaseService.setup();
    getIt.registerSingleton(FireStoreService.setup());
    getIt.registerSingleton(FirebaseAuthService.setup());
  }

}