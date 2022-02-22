import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class Reset extends StatefulWidget {

  const Reset({Key? key}) : super(key: key);
  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  final _formKey = GlobalKey<FormState>();
  String email='';
  // editing controller
  TextEditingController emailEditingController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("please enter your email");
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          email = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          filled: true,
          fillColor: Colors.orangeAccent,
          hintText: 'Enter your email',

        ));
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.lightBlueAccent,
      child: MaterialButton(
        onPressed: () {
          if(_formKey.currentState!.validate()){
            _formKey.currentState!.save();
          FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) => Navigator.of(context).pop());
          }
        },
        child: Text(
          'ResetPassword',
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

                    signUpButton,
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

