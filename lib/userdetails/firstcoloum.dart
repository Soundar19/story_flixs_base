
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:story_flixs_base/userdetails/secondcolum.dart';

class User1 extends StatefulWidget {
  const User1({Key? key}) : super(key: key);

  @override
  _User1State createState() => _User1State();
}

class _User1State extends State<User1> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // FirebaseDatabase database = FirebaseDatabase.instance;

  String first = '', last = '';
  //
  // // editing controller
  TextEditingController firstController =  TextEditingController();
   TextEditingController lastController =  TextEditingController();
  // void upload()async{
  //   DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
  //   final _dbRef = FirebaseDatabase.instance.reference();
  //   var tableRef = _dbRef.child('userotherdata');
  //   tableRef.set({
  //     'firstname':first,
  //     'lastname':last
  //   });
  //   tableRef.push();
  //   print('Push called');
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //       apiKey: "AIzaSyCYlzTdBKsFLeetWiFrktPsIL1XxbQ2-ZQ",
  //       appId: "1:590201648397:android:98390cbc6ed738f7ad2c44",
  //       messagingSenderId: "590201648397",
  //       projectId: "login-774bb",
  //       databaseURL: "https://login-774bb-default-rtdb.firebaseio.com/",
  //     ),);
  //
  //   // Fluttertoast.showToast(msg:onError.me ssage,toastLength: Toast.LENGTH_SHORT,
  //   //     gravity: ToastGravity.CENTER,backgroundColor: Colors.white,
  //   //     timeInSecForIosWeb: 1 );
  // }
  @override
  //nest line

  Widget build(BuildContext context) {
    final dbRef = FirebaseDatabase.instance.ref();
    final firstname = TextFormField(
        autofocus: false,
        controller:firstController,
        keyboardType: TextInputType.name,
        onSaved: (value) {
          first = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person_add),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          filled: true,
          fillColor: Colors.orangeAccent,
          hintText: 'Enter first name',
        ));

    final lastname = TextFormField(
        autofocus: false,
        controller: lastController,
        // obscureText: true,
        onSaved: (value) {
          last = value!;
        },
        // onSaved: (value) {
        //   passwordEditingController.text = value!;
        // },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          filled: true,
          fillColor: Colors.orangeAccent,
          hintText: 'last name',
        ));
    return Scaffold(
      appBar: AppBar(
        title: Text("Stage 1"),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 00, 40, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            firstname,
            SizedBox(
              height: 20,
            ),
            lastname,
            SizedBox(
              height: 30,
            ),
            Row(
              children: [ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Previous')),SizedBox(width: 30,),
                ElevatedButton(
                    onPressed: () async {
                      var tableRef = dbRef.child('Userdata');
                      await tableRef.child('fullname').set({
                        'first':firstController.text,
                        'name': lastController.text,
                      });

                      // upload();

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Stage2()));
                    },
                    child: Text('Next')),
              ],
            ),
            SizedBox(height: 70,),
            Text('Step 1 of 3 completed'),SizedBox(height: 10,),
            SizedBox(height: 10,),
            LinearProgressIndicator(
              backgroundColor: Colors.white70,
              valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
              minHeight: 10.0,
              value: 0.03,

            ),
          ],
        ),
      ),
    );
  }
}
