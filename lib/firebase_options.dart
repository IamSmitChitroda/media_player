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
    apiKey: 'AIzaSyAXIlnyxXvHlmItYZbIYBOKEXYaHRcpFYM',
    appId: '1:718328877366:web:ace90bd06a41219defa397',
    messagingSenderId: '718328877366',
    projectId: 'music-app-b9838',
    authDomain: 'music-app-b9838.firebaseapp.com',
    storageBucket: 'music-app-b9838.appspot.com',
    measurementId: 'G-1G2HXBQFPC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXbKgcIERkCYDwoULpd_iy_LHtHHB0AiY',
    appId: '1:718328877366:android:b381a2ca815e2ee7efa397',
    messagingSenderId: '718328877366',
    projectId: 'music-app-b9838',
    storageBucket: 'music-app-b9838.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2lyagQzaIw7gNv2V4K6GBdcMtrgCxUis',
    appId: '1:718328877366:ios:436735a78e62a7c7efa397',
    messagingSenderId: '718328877366',
    projectId: 'music-app-b9838',
    storageBucket: 'music-app-b9838.appspot.com',
    iosBundleId: 'com.mediaplayer.smitMediaPlayer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2lyagQzaIw7gNv2V4K6GBdcMtrgCxUis',
    appId: '1:718328877366:ios:436735a78e62a7c7efa397',
    messagingSenderId: '718328877366',
    projectId: 'music-app-b9838',
    storageBucket: 'music-app-b9838.appspot.com',
    iosBundleId: 'com.mediaplayer.smitMediaPlayer',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAXIlnyxXvHlmItYZbIYBOKEXYaHRcpFYM',
    appId: '1:718328877366:web:6a394d09d026b122efa397',
    messagingSenderId: '718328877366',
    projectId: 'music-app-b9838',
    authDomain: 'music-app-b9838.firebaseapp.com',
    storageBucket: 'music-app-b9838.appspot.com',
    measurementId: 'G-1WFFF06T4J',
  );
}
