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
    apiKey: 'AIzaSyBLqnRh7vKhuuWK5chCdvhZZnIRXp1PpbQ',
    appId: '1:773759580415:web:59d987b8f8d4a6a5e9b4ca',
    messagingSenderId: '773759580415',
    projectId: 'ahmadportfolio-94736',
    authDomain: 'ahmadportfolio-94736.firebaseapp.com',
    storageBucket: 'ahmadportfolio-94736.firebasestorage.app',
    measurementId: 'G-6LSJCMWEES',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQjnta_w_aKTWi3krGpiTgG_2CQ8KMrUg',
    appId: '1:773759580415:android:df4e8ec0e795b6b0e9b4ca',
    messagingSenderId: '773759580415',
    projectId: 'ahmadportfolio-94736',
    storageBucket: 'ahmadportfolio-94736.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgDnA5G4QlsEGK_SlPObSRkvOslpKLiK4',
    appId: '1:773759580415:ios:4deae9df3a3c2cc2e9b4ca',
    messagingSenderId: '773759580415',
    projectId: 'ahmadportfolio-94736',
    storageBucket: 'ahmadportfolio-94736.firebasestorage.app',
    iosBundleId: 'dev.ahmadghauri.portfoliosite',
  );
}
