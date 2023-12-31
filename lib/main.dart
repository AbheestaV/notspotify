import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/library_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'models/song.dart';
import 'services/database_service.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: RootPage(),
  ));
}

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();  // Show some loading screen
        } else {
          if (snapshot.hasData) {
            return MyApp();  // If user is logged in, show main app
          }
          return LoginPage();  // If not logged in, show login page
        }
      },
    );
  }
}




class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _screens = [HomeScreen(), SearchScreen(), LibraryScreen(),];
    return Scaffold(
      appBar: AppBar(
              title: Text('Spootify'),
            ),
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _auth.signOut();
        },
        child: Icon(Icons.logout),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Your Library',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}





class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Spotify Cloned us'),
      ),
    );
  }
}
