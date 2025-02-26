// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCKfRhNctEy0ENGM7ok6dGMEZ3hO2wRkP0',
    appId: '1:1005143088904:web:283c6c181656b520d196bd',
    messagingSenderId: '1005143088904',
    projectId: 'amasyada-okuyorum',
    authDomain: 'amasyada-okuyorum.firebaseapp.com',
    storageBucket: 'amasyada-okuyorum.firebasestorage.app',
    measurementId: 'G-VERZ4PMDDZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyArImJy2_nPO_i1oaFNIPe_DSmV7pv5vHQ',
    appId: '1:1005143088904:android:544371e821202c87d196bd',
    messagingSenderId: '1005143088904',
    projectId: 'amasyada-okuyorum',
    storageBucket: 'amasyada-okuyorum.firebasestorage.app',
  );
}
