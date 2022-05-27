import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential user = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  Future<UserCredential> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential user = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  Future<void> logOut() async {
    try {
      await _fAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  Stream<User?> get onAuthStateChanged => _fAuth.authStateChanges();

  // GET UID
  Future<String> getCurrentUID() async {
    return _fAuth.currentUser!.uid;
  }
}
