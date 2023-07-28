// login_page.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Email"),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) => _email = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) => _password = value,
            ),
            ElevatedButton(
              onPressed: () async {
                final form = _formKey.currentState;
                form?.save();
                if(form?.validate() ?? false) {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(email: _email!, password: _password!);
                    // Navigate to Home Page
                    Navigator.pushReplacementNamed(context, "/home");
                  } catch(e) {
                    print(e);
                  }
                }
              },
              child: Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
