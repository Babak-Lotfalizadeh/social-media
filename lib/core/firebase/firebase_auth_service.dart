import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final _instance = FirebaseAuth.instance;

  FirebaseAuthService.setup();

  User? get user => _instance.currentUser;

  bool isLogin() => _instance.currentUser != null;

  void listen() {
    _instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    var result = await _instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result.user != null;
  }
}
