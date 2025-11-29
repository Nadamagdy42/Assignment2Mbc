import 'package:flutter/material.dart';
import 'enroll_page.dart';
import 'enrolled_page.dart';
import '../core/user_auth.dart';
import 'login_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Home")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Center(
                child: Text("Menu",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
              ),
            ),
            ListTile(
                leading: Icon(Icons.book),
                title: Text("My Courses"),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => EnrolledPage()))),
            ListTile(
                leading: Icon(Icons.add),
                title: Text("Enroll Courses"),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => EnrollPage()))),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () async {
                await UserAuth().logout();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("Welcome Student",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade900)),
      ),
    );
  }
}
