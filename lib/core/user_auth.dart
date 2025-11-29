import 'package:firebase_auth/firebase_auth.dart';

class UserAuth {
  final _auth = FirebaseAuth.instance;

  Future<String> login(String email, String pass) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> register(String email, String pass) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  String? get uid => _auth.currentUser?.uid;
}
