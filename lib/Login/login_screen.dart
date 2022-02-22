import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:story_flixs_base/profile/profile.dart';
import 'package:story_flixs_base/resetpassword.dart';
import 'package:story_flixs_base/resgister/register_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
} 

class _LoginScreenState extends State<LoginScreen> {
  // form key
  GlobalKey<FormState>formKey = GlobalKey<FormState>();
  String _em='', _pa='';

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //ffgfs
  void signIn()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _em, password: _pa).catchError((onError){
      print("heloow$onError");
      Fluttertoast.showToast(msg: 'no user found',toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5);
     // Fluttertoast.showToast(msg:onError.me ssage,toastLength: Toast.LENGTH_SHORT,
     //     gravity: ToastGravity.CENTER,backgroundColor: Colors.white,
     //     timeInSecForIosWeb: 1 );
    }).then((authUser) {
     if(authUser.user != null){
       Fluttertoast.showToast(msg: 'Login',toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.CENTER,
           timeInSecForIosWeb: 1);
       print('login');
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(val: _em,)));
     }
    });
  }
  @override
  Widget build(BuildContext context) {

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
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
          _em = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          filled: true,
          fillColor: Colors.orangeAccent,
          hintText: 'Enter your email',
        ));
    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
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
          _pa=value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          filled: true,
          fillColor: Colors.orangeAccent,
          hintText: 'Enter Password',
        ));
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.lightBlueAccent,
      child: MaterialButton(
        onPressed: () {
          if (formKey.currentState!.validate()){
            formKey.currentState!.save();
            signIn();
            // if(emailController.text=="1997soundar@gmail.com"&&passwordController.text=="123456"){
            //   Navigator.push(context,MaterialPageRoute(builder: (context)=>Profile()));
            // }
            // else{print("invalid crenditial");}
            // print(emailController.text);
            print(passwordController.text);

          }
          // signIn(emailController.text, passwordController.text);
        },
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: Padding(
                  padding: const EdgeInsets.fromLTRB(00, 00, 0, 80),
                  child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold)),
                ),
                ),
                Container(child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,0 ,0 ,0 ),
                      child: Text('Enter Email Id/phone No',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,
                            fontSize: 17.0,
                          )),
                    ),
                  ],
                ),),
                SizedBox(height: 20,),
                emailField,
                SizedBox(
                  height: 20,
                ),
                Container(child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text('Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,
                            fontSize: 17.0,
                          )),
                    ),
                  ],
                ),),
                SizedBox(height: 20,),
                passwordField,
                SizedBox(
                  height: 20,
                ),
                Container(
                    child:
                        Container(width: 150, height: 50, child: loginButton)),
                SizedBox(
                  height: 20,
                ),
                TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Reset()));}, child: Text(
                  "Forget Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    fontSize: 15,
                  ),
                )),
                Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text(
                        "Dont have an account?",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.00),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen(valu: '',)));
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ]))
              ],
            ),
          ),
        ),
      )),
    );
  }

  // // login function
  // void signIn(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     await _auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((uid) => {
  //               Fluttertoast.showToast(msg: "Login successfull"),
  //               Navigator.of(context).pushReplacement(
  //                   MaterialPageRoute(builder: (context) => Profile())),
  //             })
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   }
  // }
}
