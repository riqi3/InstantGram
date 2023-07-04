import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instantgram/authentication/GoogleAuth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

Future<void> _signout() async{
  await FirebaseAuth.instance.signOut();
  await auth.signOut();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('homescreen'),
        actions: [
          GestureDetector(
            onTap: () {
              _signout;
              print('logouts');
            },
            child: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
