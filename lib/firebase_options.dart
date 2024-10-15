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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBGOQ0hhgUAWM31otH12Vz0otHalKeuZdg',
    appId: '1:1040080555982:web:001cc7a7b74c9201cba59f',
    messagingSenderId: '1040080555982',
    projectId: 'masswardrobe',
    authDomain: 'masswardrobe.firebaseapp.com',
    databaseURL: 'https://masswardrobe-default-rtdb.firebaseio.com',
    storageBucket: 'masswardrobe.appspot.com',
    measurementId: 'G-LC459639ZL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfpC8r-eTVzOYZ59XLNDqfRcQgbTBDiVQ',
    appId: '1:1040080555982:android:74150f2ef558b75acba59f',
    messagingSenderId: '1040080555982',
    projectId: 'masswardrobe',
    databaseURL: 'https://masswardrobe-default-rtdb.firebaseio.com',
    storageBucket: 'masswardrobe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArjvrGJJZrmjitOzOorSwBQfd7NpysfY4',
    appId: '1:1040080555982:ios:89f48c7aa64b8769cba59f',
    messagingSenderId: '1040080555982',
    projectId: 'masswardrobe',
    databaseURL: 'https://masswardrobe-default-rtdb.firebaseio.com',
    storageBucket: 'masswardrobe.appspot.com',
    iosBundleId: 'com.example.masswardrobe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArjvrGJJZrmjitOzOorSwBQfd7NpysfY4',
    appId: '1:1040080555982:ios:89f48c7aa64b8769cba59f',
    messagingSenderId: '1040080555982',
    projectId: 'masswardrobe',
    databaseURL: 'https://masswardrobe-default-rtdb.firebaseio.com',
    storageBucket: 'masswardrobe.appspot.com',
    iosBundleId: 'com.example.masswardrobe',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBGOQ0hhgUAWM31otH12Vz0otHalKeuZdg',
    appId: '1:1040080555982:web:95ffbaa2ea8cd353cba59f',
    messagingSenderId: '1040080555982',
    projectId: 'masswardrobe',
    authDomain: 'masswardrobe.firebaseapp.com',
    databaseURL: 'https://masswardrobe-default-rtdb.firebaseio.com',
    storageBucket: 'masswardrobe.appspot.com',
    measurementId: 'G-T452BSJ1PG',
  );

}