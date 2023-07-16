import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:instantgram/state/auth/constant/constants.dart';
import 'package:instantgram/state/auth/modelEnums/authentication_results.dart';
import 'package:instantgram/state/post/typedefs/user_id.dart';

class Authenticator {
  const Authenticator();

  // getters

  bool get isAlreadyLoggedIn => userId != null;
  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;
  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';
  String? get email => FirebaseAuth.instance.currentUser?.email;

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();

    // return AuthResult.aborted;
  }

  Future<AuthResult> signInWithGitHub() async {
    // Create a new provider
    GithubAuthProvider githubProvider = GithubAuthProvider();

    // Add the necessary scopes
    githubProvider.addScope(Constants.emailScope);

    try {
      // Sign in with the GitHub provider
      // EasyLoading.show(status: 'Logging in ....');
      await FirebaseAuth.instance.signInWithProvider(githubProvider);

      //EasyLoading.dismiss();
      return AuthResult.success;
    } catch (e) {
      ////EasyLoading.dismiss();
      return AuthResult.failure;
    }
  }

// Future<UserCredential> signInWithGitHub() async {
//   // Create a new provider
//   GithubAuthProvider githubProvider = GithubAuthProvider(
//   );
//     githubProvider.addScope(Constants.emailScope);

//   return await FirebaseAuth.instance.signInWithProvider(githubProvider);
// }

// Future<UserCredential> signInWithGitHub() async {
//   // Create a new provider
//   GithubAuthProvider githubProvider = GithubAuthProvider();

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithPopup(githubProvider);

//   // Or use signInWithRedirect
//   // return await FirebaseAuth.instance.signInWithRedirect(githubProvider);
// }

  Future<AuthResult> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId:
          // '717498044189-4kk01jpa8q3n0bo91f0fnr37eoun4qo8.apps.googleusercontent.com',
          '684641613737-hns82gd66ails95fb9idk71gvjkmeu26.apps.googleusercontent.com',
      //       'com.googleusercontent.apps.717498044189-4kk01jpa8q3n0bo91f0fnr37eoun4qo8',
      scopes: [
        Constants.emailScope,
      ],
    );
    final signInAccount = await googleSignIn.signIn();
    // EasyLoading.show(status: 'Logging in ....');
    if (signInAccount == null) {
      return AuthResult.aborted;
    }

    final googleAuth = await signInAccount.authentication;
    final oauthCredentials = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(
        oauthCredentials,
      );
      //EasyLoading.dismiss();
      return AuthResult.success;
    } catch (e) {
      //EasyLoading.dismiss();
      return AuthResult.failure;
    }
  }
}
