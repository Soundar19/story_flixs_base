// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Firebase.initializeApp();
//
//   debugPrint('main');
//   FirebaseAuth.instance.authStateChanges().listen((event) {
//     debugPrint('event ${event.toString()}');
//   });
//
//   // runApp(MaterialApp(
//   //   home: Scaffold(
//   //     appBar: AppBar(
//   //       title: Text('test'),
//   //     ),
//   //   ),
//   // ));
// }