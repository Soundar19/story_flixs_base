import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:story_flixs_base/Location/location.dart';
import 'package:story_flixs_base/userdetails/firstcoloum.dart';
import 'package:story_flixs_base/Login/login_screen.dart';

class Profile extends StatefulWidget {
   Profile({Key? key,required this.val}) : super(key: key);
  String val;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {







    return Scaffold( backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Story Flixs',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(
              child: Image.asset("assets/logo11.jpg"),
              height: 100,
            ),
            SizedBox(height: 50,),
            Text(
              'Welcome to Story Flix',
              style: TextStyle(
                  color: Colors.white60,
                  fontSize:30,
                  fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 27,
            ),
            Container(
              child: Text(
                'Email',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.val,
              style: TextStyle(
                  color: Colors.white60,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Container(child: ActionChip(label: Text('Logout'), onPressed: (){Signout();Navigator.pop(context);})),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                MapUtils.openMap(12.8395077,80.2215765);
              },child: Text('current location',style: TextStyle(color: Colors.white),) ,
            )
          ],
        ),
      )),
      drawer:Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Profile'),
            ),
            ListTile(
              title: const Text('update'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>User1()));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
            ),
          ],
        ),
      ) ,
    );
  }
  void Signout()async{

    await _firebaseAuth.signOut();

  }
}
