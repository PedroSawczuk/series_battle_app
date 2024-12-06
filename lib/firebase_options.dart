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
    apiKey: 'AIzaSyBJqwIbhd6BTu0D28yWw7RUwzOkGTpY86U',
    appId: '1:912535486178:web:d9185f03249102d22c28bb',
    messagingSenderId: '912535486178',
    projectId: 'series-battle-app',
    authDomain: 'series-battle-app.firebaseapp.com',
    storageBucket: 'series-battle-app.firebasestorage.app',
    measurementId: 'G-KNRZ9ZR697',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJlCYbTT7mWwtp9xT8jttrCwCcX9wNDig',
    appId: '1:912535486178:android:3c2de8d9466743e22c28bb',
    messagingSenderId: '912535486178',
    projectId: 'series-battle-app',
    storageBucket: 'series-battle-app.firebasestorage.app',
  );
}
