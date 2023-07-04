import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:instantgram/constants/githubapi/GitHubAPI.dart';
import 'package:instantgram/screens/Screens.dart';

class GitHubAuth extends StatefulWidget {
  const GitHubAuth({super.key});

  @override
  State<GitHubAuth> createState() => _GitHubAuthState();
}

class _GitHubAuthState extends State<GitHubAuth> {
  // Future<UserCredential> signInWithGitHub(BuildContext context) async {
  //   // Create a GitHubSignIn instance
  //   final GitHubSignIn gitHubSignIn = GitHubSignIn(
  //       clientId: GitHubAPI.clientID,
  //       clientSecret: GitHubAPI.clientSecret,
  //       redirectUrl: GitHubAPI.redirectUrl);

  //   // Trigger the sign-in flow
  //   final result = await gitHubSignIn.signIn(context);

  //   // Create a credential from the access token
  //   final githubAuthCredential = GithubAuthProvider.credential(result.token!);

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance
  //       .signInWithCredential(githubAuthCredential);
  // }

Future<UserCredential> signInWithGitHub() async {
  // Create a new provider
  GithubAuthProvider githubProvider = GithubAuthProvider();

  return await FirebaseAuth.instance.signInWithProvider(githubProvider);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: Card(
          child: Column(
            children: [
              MaterialButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30.0,
                      width: 30.0,
                      child: FaIcon(
                        FontAwesomeIcons.github,
                        color: Colors.black,
                      ),
                      // decoration: BoxDecoration(
                      //   // image: DecorationImage(
                      //   //     image: AssetImage('assets/images/googleimage.png'),
                      //   //     fit: BoxFit.cover),
                      //   shape: BoxShape.circle,
                      // ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Sign In with GitHub")
                  ],
                ),
                onPressed: () async {
                  final user = await signInWithGitHub();
                  if (user != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
