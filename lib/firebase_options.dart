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
    apiKey: 'AIzaSyAWXcApRY-LI4iPcI4XXsDJaXnM5S4w6IE',
    appId: '1:578264285091:web:d91290572465ec23a2e416',
    messagingSenderId: '578264285091',
    projectId: 'finalbloc',
    authDomain: 'finalbloc.firebaseapp.com',
    storageBucket: 'finalbloc.appspot.com',
    measurementId: 'G-SBL6H9CN6P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7SfOZJBI2W5OTk18TPlVMa2i7gJFQYRs',
    appId: '1:578264285091:android:0aa0a7981f785569a2e416',
    messagingSenderId: '578264285091',
    projectId: 'finalbloc',
    storageBucket: 'finalbloc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB744ekgMSuN2evdWSBWtsMqOTwJnP1_vM',
    appId: '1:578264285091:ios:3c6eb783dc49764aa2e416',
    messagingSenderId: '578264285091',
    projectId: 'finalbloc',
    storageBucket: 'finalbloc.appspot.com',
    iosClientId: '578264285091-tsqr2d6218vrmgijsdq88s75k0j7kuoe.apps.googleusercontent.com',
    iosBundleId: 'com.example.finals',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB744ekgMSuN2evdWSBWtsMqOTwJnP1_vM',
    appId: '1:578264285091:ios:3c6eb783dc49764aa2e416',
    messagingSenderId: '578264285091',
    projectId: 'finalbloc',
    storageBucket: 'finalbloc.appspot.com',
    iosClientId: '578264285091-tsqr2d6218vrmgijsdq88s75k0j7kuoe.apps.googleusercontent.com',
    iosBundleId: 'com.example.finals',
  );
}
