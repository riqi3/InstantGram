// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBsjMFMw8IL-UH38QtDVNXwYD94OmzYlbQ',
    appId: '1:684641613737:web:de685d97541f8aed93b6b8',
    messagingSenderId: '684641613737',
    projectId: 'midtermprojectinstaclone',
    authDomain: 'midtermprojectinstaclone.firebaseapp.com',
    storageBucket: 'midtermprojectinstaclone.appspot.com',
    measurementId: 'G-7ZL2B4RGWV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmI9r7wUom1ZyhOi5v0D1fR0ElZZEUVxE',
    appId: '1:684641613737:android:05cf4807b706680c93b6b8',
    messagingSenderId: '684641613737',
    projectId: 'midtermprojectinstaclone',
    storageBucket: 'midtermprojectinstaclone.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWPvEhCnO2MGDYsxOojeRpz8OhN1HZv-Y',
    appId: '1:684641613737:ios:83d28ef388b6c98793b6b8',
    messagingSenderId: '684641613737',
    projectId: 'midtermprojectinstaclone',
    storageBucket: 'midtermprojectinstaclone.appspot.com',
    iosClientId: '684641613737-5ljh1p0p9ahtdp3sqeitm42dk7he3m01.apps.googleusercontent.com',
    iosBundleId: 'com.example.indagram',
  );
}
