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
    apiKey: 'AIzaSyAo4aWGXwFisXbU8MF5My3RUNWLx_mJugg',
    appId: '1:669882504795:web:42e6c1bd0dd05fbf1c517e',
    messagingSenderId: '669882504795',
    projectId: 'coba-979f2',
    authDomain: 'coba-979f2.firebaseapp.com',
    storageBucket: 'coba-979f2.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2SgOWOyHrlbM1Mdjy6rTgV4Kd7yRYSEo',
    appId: '1:669882504795:android:ff3c25c8bf441e9f1c517e',
    messagingSenderId: '669882504795',
    projectId: 'coba-979f2',
    storageBucket: 'coba-979f2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvEfELWo6arNVto3JrgdJGC1p3TK1Nv-M',
    appId: '1:669882504795:ios:2e5e852c3cbef04e1c517e',
    messagingSenderId: '669882504795',
    projectId: 'coba-979f2',
    storageBucket: 'coba-979f2.firebasestorage.app',
    iosBundleId: 'com.example.rentalinId',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBvEfELWo6arNVto3JrgdJGC1p3TK1Nv-M',
    appId: '1:669882504795:ios:2e5e852c3cbef04e1c517e',
    messagingSenderId: '669882504795',
    projectId: 'coba-979f2',
    storageBucket: 'coba-979f2.firebasestorage.app',
    iosBundleId: 'com.example.rentalinId',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAo4aWGXwFisXbU8MF5My3RUNWLx_mJugg',
    appId: '1:669882504795:web:747cbe27d7ade8d31c517e',
    messagingSenderId: '669882504795',
    projectId: 'coba-979f2',
    authDomain: 'coba-979f2.firebaseapp.com',
    storageBucket: 'coba-979f2.firebasestorage.app',
  );

}