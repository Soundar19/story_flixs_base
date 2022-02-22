import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:story_flixs_base/Login/login_screen.dart';
import 'package:story_flixs_base/profile/profile.dart';




class RegisterScreen extends StatefulWidget {
  String valu;
   RegisterScreen({Key? key, required this.valu}) : super(key: key);

 // String? get vaty => valu;
 // set va(String input)=> valu=input;



  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String email='', pass='',conpass='';
  // editing controller
  TextEditingController emailEditingController =  TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  // String get text1 => null;
  @override
  Widget build(BuildContext context) {
    final dbRefem = FirebaseDatabase.instance.ref();

    final emailField = TextFormField(
        autofocus: false,
        // initialValue:val.vaty,
        controller: emailEditingController = TextEditingController()..text= widget.valu,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("please enter your email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          email = value!;
        },
        // onSaved: (value) {
        //   emailEditingController.text = value!;
        // },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          filled: true,
          fillColor: Colors.orangeAccent,
          hintText: 'Enter your email',

        ));

    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          //validation
          RegExp regex = new RegExp(r'^.{6,}$'); //minimum 6 charc
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          pass=value!;
        },
        // onSaved: (value) {
        //   passwordEditingController.text = value!;
        // },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          filled: true,
          fillColor: Colors.orangeAccent,
          hintText: 'Enter Password',
        ));
    //conpassword field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          //validation
          RegExp regex = new RegExp(r'^.{6,}$'); //minimum 6 charc
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          if(passwordEditingController==confirmPasswordEditingController){
            return('password mismtach');
          }
        },
        onSaved: (value) {
          conpass=value!;
        },
        // onSaved: (value) {
        //   confirmPasswordEditingController.text = value!;
        // },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          filled: true,
          fillColor: Colors.orangeAccent,
          hintText: 'Enter confirm Password',
        ));
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.lightBlueAccent,
      child: MaterialButton(
        onPressed: () async{

    var tableRef3 = dbRefem.child('Userdata');
    await tableRef3.child('emailpassword').set({
    'email':emailEditingController.text,
    'password': passwordEditingController.text,
    });

          if(_formKey.currentState!.validate()){
            _formKey.currentState!.save();
            

          }
          Signup();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(val: widget.valu,)));
        },
        child: Text(
          'SignUp',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                emailField,
                SizedBox(
                  height: 20,
                ),
                passwordField,
                SizedBox(
                  height: 20,
                ),
                confirmPasswordField,
                SizedBox(
                  height: 20,
                ),
                Container(
                    child:
                        Container(width: 150, height: 50, child: signUpButton)),
                SizedBox(height: 10),
                Container(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Alread have a account?',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.00),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                            )),
                      ]),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
  void Signup() async {

    try {
       await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email,
          password:pass
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}

