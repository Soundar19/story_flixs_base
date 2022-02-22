import 'package:flutter/material.dart';
import 'package:story_flixs_base/Login/login_screen.dart';
import 'package:story_flixs_base/resgister/register_screen.dart';
import 'package:story_flixs_base/videoplayer/videoref.dart';


class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String sup = "";
  void onSubmit(String val1) {
    setState(() {
      sup = val1;
    });
  }

  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            backgroundColor: Colors.grey[900],
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>VideoApp(
                                      )));
                        },
                        child: Text('video'),
                      ),
                    ),
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage("assets/logo11.jpg"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'StoryFlix',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 00, 40, 0),
                      child: TextField(
                          controller: textEditingController,
                          onSubmitted: onSubmit,
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            filled: true,
                            fillColor: Colors.orangeAccent,
                            hintText: 'Get started',
                            suffixIcon: IconButton(
                              onPressed: () {
                                onSubmit(textEditingController.text);
                                // var email=RegisterScreen();
                                // email.va=sup;
                                print(textEditingController.text);
                                // print(email.valu);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterScreen(
                                              valu: sup,
                                            )));
                              },
                              icon: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 13,
                    ),
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
            ));
  }
}
