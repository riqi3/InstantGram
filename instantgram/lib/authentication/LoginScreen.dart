import 'package:flutter/material.dart';

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
            height: 500,
            child: GoogleAuth(),
            ),
        ],
      ),
    );
  }
}
