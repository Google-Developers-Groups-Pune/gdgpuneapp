import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDJV9QIU92yDvn_TzeSeSza1C96VRokIaA",
            authDomain: "devfest-pune-app.firebaseapp.com",
            projectId: "devfest-pune-app",
            storageBucket: "devfest-pune-app.firebasestorage.app",
            messagingSenderId: "38899088358",
            appId: "1:38899088358:web:7a43180455f996d368f427",
            measurementId: "G-5WYW6X5HCW"));
  } else {
    await Firebase.initializeApp();
  }
}
