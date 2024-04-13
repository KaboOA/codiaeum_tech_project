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
    apiKey: 'AIzaSyBacSx_K_nZpLvrxz90bP6QA54XFRmDFjw',
    appId: '1:679039224252:web:3d49dca35573d239e0c3b9',
    messagingSenderId: '679039224252',
    projectId: 'codiaeumtech-4a075',
    authDomain: 'codiaeumtech-4a075.firebaseapp.com',
    storageBucket: 'codiaeumtech-4a075.appspot.com',
    measurementId: 'G-2H7FJZVPBW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpE5ei06MOW0t0IfBby8B7Jf0MtjUdtfQ',
    appId: '1:679039224252:android:1a2a65cacd37be09e0c3b9',
    messagingSenderId: '679039224252',
    projectId: 'codiaeumtech-4a075',
    storageBucket: 'codiaeumtech-4a075.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAul8mErWUEu8gzxAd0eTdcv_vZY71KiZE',
    appId: '1:679039224252:ios:598df90453965333e0c3b9',
    messagingSenderId: '679039224252',
    projectId: 'codiaeumtech-4a075',
    storageBucket: 'codiaeumtech-4a075.appspot.com',
    iosBundleId: 'com.example.codiaeumTechProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAul8mErWUEu8gzxAd0eTdcv_vZY71KiZE',
    appId: '1:679039224252:ios:598df90453965333e0c3b9',
    messagingSenderId: '679039224252',
    projectId: 'codiaeumtech-4a075',
    storageBucket: 'codiaeumtech-4a075.appspot.com',
    iosBundleId: 'com.example.codiaeumTechProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBacSx_K_nZpLvrxz90bP6QA54XFRmDFjw',
    appId: '1:679039224252:web:8d24c39b011bf69be0c3b9',
    messagingSenderId: '679039224252',
    projectId: 'codiaeumtech-4a075',
    authDomain: 'codiaeumtech-4a075.firebaseapp.com',
    storageBucket: 'codiaeumtech-4a075.appspot.com',
    measurementId: 'G-8X2J89TH58',
  );
}