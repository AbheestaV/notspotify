import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              child: Text('Sign Out'),
              onPressed: () {
                _signOut().then((_) {
                  Navigator.pushReplacementNamed(context, '/');
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut() async {
    await _auth.signOut();
  }
}
