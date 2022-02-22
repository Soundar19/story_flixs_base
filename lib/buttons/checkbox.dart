// import 'package:flutter/material.dart';
//
//
// class Check_box extends StatefulWidget {
//   @override
//   _Check_boxState createState() => _Check_boxState();
// }
//
// class _Check_boxState extends State<Check_box> {
//   bool value = false;
//
//   @override
//   //App widget tree
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(//AppBar
//         body: Center(
//           /** Card Widget **/
//           child: Card(
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: SizedBox(
//                 width: 430,
//                 height: 700,
//                 child: Column(
//                   children: [
//                     Text(
//                       'Algorithms',
//                       style: TextStyle(
//                           color: Colors.greenAccent[400],
//                           fontSize: 30), //TextStyle
//                     ), //Text
//                     SizedBox(height: 10),
//                     Row(
//                       children: <Widget>[
//                         SizedBox(
//                           width: 10,
//                         ), //SizedBox
//                         Text(
//                           'Library Implementation Of Searching Algorithm: ',
//                           style: TextStyle(fontSize: 17.0),
//                         ), //Text
//                         SizedBox(width: 10), //SizedBox
//                         /** Checkbox Widget **/
//                         Checkbox(
//                           value: this.value,
//                           onChanged: ( value) {
//                             setState(() {
//                               this.value = value!;
//                             });
//                           },
//                         ), //Checkbox
//                       ], //<Widget>[]
//                     ), //Row
//                   ],
//                 ), //Column
//               ), //SizedBox
//             ), //Padding
//           ), //Card
//         ), //Center//Center
//       ), //Scaffold
//     ); //MaterialApp
//   }
// }