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
    apiKey: 'AIzaSyBLqbysj8vAApm_zXgy_07md9LZHuQeWF4',
    appId: '1:617816440419:web:8ac6e44def735e839c0256',
    messagingSenderId: '617816440419',
    projectId: 'ghoreparlour',
    authDomain: 'ghoreparlour.firebaseapp.com',
    storageBucket: 'ghoreparlour.firebasestorage.app',
    measurementId: 'G-P89ZE5S3WC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCF_mHc7VygGRV7sZydQpBHe-oTVp0HLQ0',
    appId: '1:617816440419:android:e665b2eb5dd191459c0256',
    messagingSenderId: '617816440419',
    projectId: 'ghoreparlour',
    storageBucket: 'ghoreparlour.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRG0HFcSfZrsjmEpfst3FelpqNMmTd2bU',
    appId: '1:617816440419:ios:a99602b4c42d68259c0256',
    messagingSenderId: '617816440419',
    projectId: 'ghoreparlour',
    storageBucket: 'ghoreparlour.firebasestorage.app',
    iosBundleId: 'com.ghoreparlour.user.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRG0HFcSfZrsjmEpfst3FelpqNMmTd2bU',
    appId: '1:617816440419:ios:eaaa5282f854f1869c0256',
    messagingSenderId: '617816440419',
    projectId: 'ghoreparlour',
    storageBucket: 'ghoreparlour.firebasestorage.app',
    iosBundleId: 'com.shebeauty.user.shebeauty',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBLqbysj8vAApm_zXgy_07md9LZHuQeWF4',
    appId: '1:617816440419:web:c5dff9b89575429d9c0256',
    messagingSenderId: '617816440419',
    projectId: 'ghoreparlour',
    authDomain: 'ghoreparlour.firebaseapp.com',
    storageBucket: 'ghoreparlour.firebasestorage.app',
    measurementId: 'G-NX8B59N5K2',
  );
}