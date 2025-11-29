import 'package:flutter/material.dart';
import '../core/firestore_db.dart';
import 'enrolled_page.dart';

class EnrollPage extends StatelessWidget {
  final courses = [
    "Social Network",
    "Human Security",
    "Information Security",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enroll Course")),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              title: Text(courses[i]),
              trailing: IconButton(
                icon: Icon(Icons.add, color: Colors.green),
                onPressed: () async {
                  await FirestoreDB().enrollCourse(courses[i]);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${courses[i]} enrolled!")));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
