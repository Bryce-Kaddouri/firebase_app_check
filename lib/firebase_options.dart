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
        return macos;
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
    apiKey: 'AIzaSyAiRfnSate3RWkL6I_bpA4cvB1-fy96eug',
    appId: '1:784556728213:web:91a0a927a40ce5c85d609c',
    messagingSenderId: '784556728213',
    projectId: 'test-appcheck-v1',
    authDomain: 'test-appcheck-v1.firebaseapp.com',
    storageBucket: 'test-appcheck-v1.appspot.com',
    measurementId: 'G-W549SMKJ1K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkliW_G8HKXZQ3TqhsO3H0hPMLuJDFY3U',
    appId: '1:784556728213:android:c5ba700b9245b5605d609c',
    messagingSenderId: '784556728213',
    projectId: 'test-appcheck-v1',
    storageBucket: 'test-appcheck-v1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwVLmPYmS3BT_EgwcHiB5exRtfRo69Oqs',
    appId: '1:784556728213:ios:4454171f2b28e41b5d609c',
    messagingSenderId: '784556728213',
    projectId: 'test-appcheck-v1',
    storageBucket: 'test-appcheck-v1.appspot.com',
    androidClientId: '784556728213-lnaubv3kl0hnngf9ts5b8c7v3tg8k89b.apps.googleusercontent.com',
    iosClientId: '784556728213-q8q5qujgd8taceisevilceic3mbvge2i.apps.googleusercontent.com',
    iosBundleId: 'com.example.testAppcheck',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwVLmPYmS3BT_EgwcHiB5exRtfRo69Oqs',
    appId: '1:784556728213:ios:aee2cf6a546fc7b05d609c',
    messagingSenderId: '784556728213',
    projectId: 'test-appcheck-v1',
    storageBucket: 'test-appcheck-v1.appspot.com',
    androidClientId: '784556728213-lnaubv3kl0hnngf9ts5b8c7v3tg8k89b.apps.googleusercontent.com',
    iosClientId: '784556728213-bj4245d8srjmg2t6219hiq2k6da1nnq0.apps.googleusercontent.com',
    iosBundleId: 'com.example.testAppcheck.RunnerTests',
  );
}