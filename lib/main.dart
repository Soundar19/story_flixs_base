
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:story_flixs_base/welcome/welcome.dart';
// EXyR4B72nAY1dKJ7dkn08UtyzNP2


// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: FirebaseOptions(
//       apiKey: "AAAAzTmgQ1s:APA91bFu-xAiu-tBcq4ieqQx5gaQZFl6TezqkrwFAc6d7YqfnSGoyGI3U5chZDmvgkQuCnc2rWWr5mETff_VOOH2qmm5ZgssPNKtfQsF2KeiAA6m8OVco9cwBZgUpSLzFdRakKDLF1mb", // Your apiKey
//       appId: "1:881435099995:android:481d7b7992d9d2e4aed07e", // Your appId
//       messagingSenderId: "881435099995", // Your messagingSenderId
//       projectId: "storyflixfirebase", // Your projectId
//     ),
//   );Unhandled Exception: [core/duplicate-app] A Firebase App named "[DEFAULT]" already exists
//   runApp(MyApp());
// }
   void main()
   async
   {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        // name: 'com.example.story_flixs_base',
      options: FirebaseOptions(
        apiKey: "AIzaSyCYlzTdBKsFLeetWiFrktPsIL1XxbQ2-ZQ",
        appId: "1:590201648397:android:98390cbc6ed738f7ad2c44",
        messagingSenderId: "590201648397",
        projectId: "login-774bb",
        databaseURL: "https://login-774bb-default-rtdb.firebaseio.com"
      ),);
    debugPrint('main');
    FirebaseAuth.instance.authStateChanges().listen((event) {
      debugPrint('event ${event.toString()}');
    });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black54,
      ),
      home: Welcome(),
    );}}
