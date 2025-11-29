import 'package:flutter/material.dart';
import '../core/firestore_db.dart';

class EnrolledPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Courses")),
      body: StreamBuilder(
        stream: FirestoreDB().myCourses(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          var docs = snapshot.data!.docs;
          if (docs.isEmpty) return Center(child: Text("No courses yet"));

          return ListView(
            children: docs
                .map<Widget>(
                    (d) => ListTile(title: Text(d["name"])))
                .toList(),
          );
        },
      ),
    );
  }
}
