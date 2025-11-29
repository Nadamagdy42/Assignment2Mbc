import 'package:flutter/material.dart';
import '../core/user_auth.dart';
import 'signup_page.dart';
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final pass = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome Back!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange.shade900)),
            Text("Please login",
                style: TextStyle(color: Colors.orange.shade700)),
            SizedBox(height: 35),

            _input(email, "Email"),
            SizedBox(height: 15),
            _input(pass, "Password", obs: true),
            SizedBox(height: 25),

            _btn("Login", () async {
              setState(() => loading = true);
              var res = await UserAuth().login(email.text, pass.text);
              setState(() => loading = false);

              if (res == "Success") {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => DashboardPage()));
              } else {
                _show(res);
              }
            }),
            SizedBox(height: 10),

            TextButton(
              onPressed: () =>
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SignupPage())),
              child: Text("Create Account"),
            )
          ],
        ),
      ),
    );
  }

  _input(c, t, {obs = false}) => TextField(
        controller: c,
        obscureText: obs,
        decoration:
            InputDecoration(labelText: t, border: OutlineInputBorder()),
      );

  _btn(title, action) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange.shade700,
            minimumSize: Size(double.infinity, 50)),
        onPressed: action,
        child: loading
            ? CircularProgressIndicator(color: Colors.white)
            : Text(title),
      );

  _show(t) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t)));
}
