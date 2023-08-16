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
    apiKey: 'AIzaSyDM1Xl4-SFyP-dZq4-Q87PXtjaSuURteTE',
    appId: '1:276739712550:web:26a7486a34294bad2e68e7',
    messagingSenderId: '276739712550',
    projectId: 'streamaster-ef692',
    authDomain: 'streamaster-ef692.firebaseapp.com',
    storageBucket: 'streamaster-ef692.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-Q8eQJ4lXVbM0QqY7CyouDo_seGuasQ8',
    appId: '1:276739712550:android:3dd6548b7e64ebda2e68e7',
    messagingSenderId: '276739712550',
    projectId: 'streamaster-ef692',
    storageBucket: 'streamaster-ef692.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFG3ExQE8j1IId-bXgKyg1eNpd0lYAQ6w',
    appId: '1:276739712550:ios:3edb8935f319bec12e68e7',
    messagingSenderId: '276739712550',
    projectId: 'streamaster-ef692',
    storageBucket: 'streamaster-ef692.appspot.com',
    iosClientId: '276739712550-2vm782uml9l5dhtle6dsiurh5334e19l.apps.googleusercontent.com',
    iosBundleId: 'com.example.streamaster',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFG3ExQE8j1IId-bXgKyg1eNpd0lYAQ6w',
    appId: '1:276739712550:ios:ca80d978e5b1bb092e68e7',
    messagingSenderId: '276739712550',
    projectId: 'streamaster-ef692',
    storageBucket: 'streamaster-ef692.appspot.com',
    iosClientId: '276739712550-3knvf13o4o8e17eb4lembtjns7k5ap17.apps.googleusercontent.com',
    iosBundleId: 'com.example.streamaster.RunnerTests',
  );
}