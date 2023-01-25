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
    apiKey: 'AIzaSyB-Ywbr2pdV-lKzOJeNe-Zd0gAicR4RvVo',
    appId: '1:266005776476:web:f2f917acad665c66023e99',
    messagingSenderId: '266005776476',
    projectId: 'gastos-foraneo',
    authDomain: 'gastos-foraneo.firebaseapp.com',
    storageBucket: 'gastos-foraneo.appspot.com',
    measurementId: 'G-NJVTQKBT1E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxI_H57SHkJWMvbq0GpZpUR74aXwLSRsY',
    appId: '1:266005776476:android:c4438bc2d2a90ec4023e99',
    messagingSenderId: '266005776476',
    projectId: 'gastos-foraneo',
    storageBucket: 'gastos-foraneo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_Hx6KDB2sKwuFgX4KonASNVQExKNWDHM',
    appId: '1:266005776476:ios:6223d49865284e87023e99',
    messagingSenderId: '266005776476',
    projectId: 'gastos-foraneo',
    storageBucket: 'gastos-foraneo.appspot.com',
    iosClientId: '266005776476-74ffubeu4mc91qkdces0ora2b53d1kqo.apps.googleusercontent.com',
    iosBundleId: 'com.example.gastosForaneo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_Hx6KDB2sKwuFgX4KonASNVQExKNWDHM',
    appId: '1:266005776476:ios:6223d49865284e87023e99',
    messagingSenderId: '266005776476',
    projectId: 'gastos-foraneo',
    storageBucket: 'gastos-foraneo.appspot.com',
    iosClientId: '266005776476-74ffubeu4mc91qkdces0ora2b53d1kqo.apps.googleusercontent.com',
    iosBundleId: 'com.example.gastosForaneo',
  );
}
