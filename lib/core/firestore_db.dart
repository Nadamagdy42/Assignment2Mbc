import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_auth.dart';

class FirestoreDB {
  final _db = FirebaseFirestore.instance;
  final _auth = UserAuth();

  Stream<QuerySnapshot> myCourses() {
    return _db
        .collection("users")
        .doc(_auth.uid)
        .collection("courses")
        .snapshots();
  }

  Future<void> enrollCourse(String courseName) async {
    await _db
        .collection("users")
        .doc(_auth.uid)
        .collection("courses")
        .doc(courseName)
        .set({"name": courseName});
  }
  Future<void> saveUserName(String name) async {
  await _db.collection("users").doc(_auth.uid).set({
    "name": name
  });
}

}
