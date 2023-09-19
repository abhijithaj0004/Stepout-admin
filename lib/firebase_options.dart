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
    apiKey: 'AIzaSyBDm7Bg3CT7rSmC2BjymS8DPnNu-4UVbbY',
    appId: '1:1058072420794:web:2593c8613a29703b907d83',
    messagingSenderId: '1058072420794',
    projectId: 'stepout-6307b',
    authDomain: 'stepout-6307b.firebaseapp.com',
    storageBucket: 'stepout-6307b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCP7mHexnxje06j8U0J4zUqHu4nTR676D8',
    appId: '1:1058072420794:android:9dcba66e18099bb9907d83',
    messagingSenderId: '1058072420794',
    projectId: 'stepout-6307b',
    storageBucket: 'stepout-6307b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDs0JPcDakNoOI57f1CJV__NLewPazNm1c',
    appId: '1:1058072420794:ios:e4c2c5821c1f87de907d83',
    messagingSenderId: '1058072420794',
    projectId: 'stepout-6307b',
    storageBucket: 'stepout-6307b.appspot.com',
    androidClientId: '1058072420794-6ig662js953he0p1b0jd48dss0fioqij.apps.googleusercontent.com',
    iosClientId: '1058072420794-a1an51bbv3omcgclmk6gh3pt731j83ai.apps.googleusercontent.com',
    iosBundleId: 'com.example.stepoutadminapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDs0JPcDakNoOI57f1CJV__NLewPazNm1c',
    appId: '1:1058072420794:ios:405651f5b14c1d7a907d83',
    messagingSenderId: '1058072420794',
    projectId: 'stepout-6307b',
    storageBucket: 'stepout-6307b.appspot.com',
    androidClientId: '1058072420794-6ig662js953he0p1b0jd48dss0fioqij.apps.googleusercontent.com',
    iosClientId: '1058072420794-llrcpigtlg1dg3alejfisbhbl27ojgea.apps.googleusercontent.com',
    iosBundleId: 'com.example.stepoutadminapp.RunnerTests',
  );
}
