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
    apiKey: 'AIzaSyA-bQhnyFeJ_7ZmfWrPqqKXifDqwav-z7E',
    appId: '1:770906247137:web:fdc7e321f7ecb76f9e0ca0',
    messagingSenderId: '770906247137',
    projectId: 'chucknorris-app-flutter',
    authDomain: 'chucknorris-app-flutter.firebaseapp.com',
    storageBucket: 'chucknorris-app-flutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC92OxvKT0LrohK-uFvxAzVtMiCOWxpRv4',
    appId: '1:770906247137:android:d9bf545c8aac03089e0ca0',
    messagingSenderId: '770906247137',
    projectId: 'chucknorris-app-flutter',
    storageBucket: 'chucknorris-app-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMw6YFD9GnzhBqXa3towG0wlbRIu7SSWI',
    appId: '1:770906247137:ios:f71f4c831caaed489e0ca0',
    messagingSenderId: '770906247137',
    projectId: 'chucknorris-app-flutter',
    storageBucket: 'chucknorris-app-flutter.appspot.com',
    iosClientId: '770906247137-015cf5b3hs65go7md90vmrq9vkno9b6b.apps.googleusercontent.com',
    iosBundleId: 'com.chucknorris.chucknorrisApp',
  );
}
