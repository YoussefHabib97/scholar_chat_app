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
    apiKey: 'AIzaSyC6quvVCFqE2qDUxtRmaguotVxuftHHq3g',
    appId: '1:32238149783:web:bbab2aef1d23e8555649d2',
    messagingSenderId: '32238149783',
    projectId: 'scholar-chat-app-36cab',
    authDomain: 'scholar-chat-app-36cab.firebaseapp.com',
    storageBucket: 'scholar-chat-app-36cab.appspot.com',
    measurementId: 'G-DLC53GXJZ1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBViGueYjuWej6PItwJlIPQ6I3kpk9Nmkg',
    appId: '1:32238149783:android:d0e93f803d5ebb215649d2',
    messagingSenderId: '32238149783',
    projectId: 'scholar-chat-app-36cab',
    storageBucket: 'scholar-chat-app-36cab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBP_19VdAcRDl9u4YW5p1bZxkCP4IgEPLc',
    appId: '1:32238149783:ios:dda67c345bb83f8a5649d2',
    messagingSenderId: '32238149783',
    projectId: 'scholar-chat-app-36cab',
    storageBucket: 'scholar-chat-app-36cab.appspot.com',
    iosBundleId: 'com.example.scholarChatApp',
  );
}
