import 'package:flutter/material.dart';
import 'package:instantgram/authentication/GitHubAuth.dart';

import 'GoogleAuth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 500,
            height: 200,
            child: GoogleAuth(),
          ),
          Container(
            width: 500,
            height: 200,
            child: GitHubAuth(),
          ),
        ],
      ),
    );
  }
}
