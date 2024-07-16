import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBXEnkl1T20tmAbJXms-v1rkdsJs6zTok4",
            authDomain: "jaap-h3fa31.firebaseapp.com",
            projectId: "jaap-h3fa31",
            storageBucket: "jaap-h3fa31.appspot.com",
            messagingSenderId: "559000904132",
            appId: "1:559000904132:web:1b74cbdc2fe38090b60491"));
  } else {
    await Firebase.initializeApp();
  }
}
