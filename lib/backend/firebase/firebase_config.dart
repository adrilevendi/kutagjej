import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        // name: "kutagjej",
        options: const FirebaseOptions(
            apiKey: "AIzaSyAAJDn2R97m_90l1GlAl5sZ_Z4pOrEZIWY",
            authDomain: "kutagjej.firebaseapp.com",
            projectId: "kutagjej",
            storageBucket: "kutagjej.appspot.com",
            messagingSenderId: "862406504590",
            appId: "1:862406504590:web:1c95e1496eed9bd84b59df",
            measurementId: "G-LPEWP1X0K3"));
  } else {
    await Firebase.initializeApp(
        options:const FirebaseOptions(
      apiKey: 'AIzaSyBJGjaAlslIN3NFxhx4lmJvG4tgYBiOyk8',
      appId: '1:862406504590:android:03cd0d9b207498274b59df',
      messagingSenderId: '862406504590',
      projectId: 'kutagjej',
    ));
  }
}
