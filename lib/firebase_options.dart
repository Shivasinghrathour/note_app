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
    apiKey: 'AIzaSyAjGyU8o_yCRxZvEEeKzt8ORiWtjiqcxAw',
    appId: '1:651900109299:web:0f70b9cb5ec61c4c65d286',
    messagingSenderId: '651900109299',
    projectId: 'noteaap-aa4ad',
    authDomain: 'noteaap-aa4ad.firebaseapp.com',
    storageBucket: 'noteaap-aa4ad.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXWKrLnS_DamhkeF_UZwGnAvlcGpdhpNI',
    appId: '1:651900109299:android:0f18992eb3f3d0a065d286',
    messagingSenderId: '651900109299',
    projectId: 'noteaap-aa4ad',
    storageBucket: 'noteaap-aa4ad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVDwRbrCbNv8Apz8P3d7uPuPd-raUk_bk',
    appId: '1:651900109299:ios:05b71b7e47a0feb965d286',
    messagingSenderId: '651900109299',
    projectId: 'noteaap-aa4ad',
    storageBucket: 'noteaap-aa4ad.appspot.com',
    iosBundleId: 'com.example.noteApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAVDwRbrCbNv8Apz8P3d7uPuPd-raUk_bk',
    appId: '1:651900109299:ios:05b71b7e47a0feb965d286',
    messagingSenderId: '651900109299',
    projectId: 'noteaap-aa4ad',
    storageBucket: 'noteaap-aa4ad.appspot.com',
    iosBundleId: 'com.example.noteApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAjGyU8o_yCRxZvEEeKzt8ORiWtjiqcxAw',
    appId: '1:651900109299:web:6970d814d98b0ee965d286',
    messagingSenderId: '651900109299',
    projectId: 'noteaap-aa4ad',
    authDomain: 'noteaap-aa4ad.firebaseapp.com',
    storageBucket: 'noteaap-aa4ad.appspot.com',
  );
}