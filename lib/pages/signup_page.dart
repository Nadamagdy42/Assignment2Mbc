import 'package:flutter/material.dart';
import '../core/user_auth.dart';
import '../core/firestore_db.dart';
import 'dashboard_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Account")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
                controller: name,
                decoration: InputDecoration(
                    labelText: "Full Name", border: OutlineInputBorder())),
            SizedBox(height: 15),
            TextField(
                controller: email,
                decoration: InputDecoration(
                    labelText: "Email", border: OutlineInputBorder())),
            SizedBox(height: 15),
            TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password", border: OutlineInputBorder())),
            SizedBox(height: 25),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade700,
                    minimumSize: Size(double.infinity, 50)),
                onPressed: () async {
                  setState(() => loading = true);

                  var res = await UserAuth().register(email.text, pass.text);

                  if (res == "Success") {
                    await FirestoreDB().saveUserName(name.text);

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DashboardPage()));
                  } else {
                    _show(res);
                  }

                  setState(() => loading = false);
                },
                child: loading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("Register"))
          ],
        ),
      ),
    );
  }

  _show(t) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t)));
}
