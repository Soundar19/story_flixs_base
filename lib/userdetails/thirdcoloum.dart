import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:story_flixs_base/userdetails/Registration.dart';

class Stage3 extends StatefulWidget {
  const Stage3({Key? key}) : super(key: key);

  @override
  _Stage3State createState() => _Stage3State();
}

class _Stage3State extends State<Stage3> {
  bool value = false;
  bool value1 = false;
  bool value2 = false;

  int val = -1;
  @override
  Widget build(BuildContext context) {
    final dbRefst = FirebaseDatabase.instance.ref();
    final checkbox = Material(
      color: Colors.tealAccent,
      borderRadius: BorderRadius.circular(20),
      child: Center(
        /** Card Widget **/
        child: Container(
          height: 200,
          width: 300,
          child: Column(
            children: [
              Text(
                'Known Language',
                style: TextStyle(
                    color: Colors.greenAccent[400],
                    fontSize: 25,fontWeight: FontWeight.bold), //TextStyle
              ), //Text
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ), //SizedBox
                  Text(
                    'English ',
                    style: TextStyle(fontSize: 17.0),
                  ), //Text
                  SizedBox(width: 13), //SizedBox
                  /** Checkbox Widget **/
                  Checkbox(
                    value: this.value,
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ), //Checkbox
                ], //<Widget>[]
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ), //SizedBox
                  Text(
                    'Tamil',
                    style: TextStyle(fontSize: 17.0),
                  ), //Text
                  SizedBox(width: 32), //SizedBox
                  /** Checkbox Widget **/
                  Checkbox(
                    value: this.value1,
                    onChanged: (value) {
                      setState(() {
                        this.value1 = value!;
                      });
                    },
                  ), //Checkbox
                ], //<Widget>[]
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ), //SizedBox
                  Text(
                    'Hindi ',
                    style: TextStyle(fontSize: 17.0),
                  ), //Text
                  SizedBox(width: 30), //SizedBox
                  /** Checkbox Widget **/
                  Checkbox(
                    value: this.value2,
                    onChanged: (value44) {
                      setState(() {
                        this.value2 = value44!;
                      });
                    },
                  ), //Checkbox
                ], //<Widget>[]
              ),//Row
            ],
          ), //Padding
        ), //Card
      ),
    );

    final radiobutton = Material(
      color: Colors.tealAccent,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 200,
        width: 300,
        child: Column(
          children: [
            Text(
              'Gender',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text("Male"),
              leading: Radio(
                value: 1,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    val = value as int;
                  });
                },
                activeColor: Colors.green,
              ),
            ),
            ListTile(
              title: Text("Female"),
              leading: Radio(
                value: 2,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    val = value as int;
                  });
                },
                activeColor: Colors.green,
              ),
            )
          ],
        ),
      ),
    );




    return Scaffold(
      appBar: AppBar(
        title: Text('Stage3'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(40, 00, 01, 00),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                children: [

              radiobutton,
              SizedBox(
               width: 20,
              ),
              checkbox,SizedBox(
                    width: 20,
                  ),Row(
                    children: [ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Previous')),SizedBox(width: 30,),
                      ElevatedButton(
                          onPressed: () async {
                            var tableRef12 = dbRefst.child('Userdata2');
                            await tableRef12.child('other details').set({
                              'gender':val,
                              'language': value,
                            });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Completed_Reg()));
                          },
                          child: Text('Summit')),
                    ],
                  ),
            ]),
            SizedBox(height: 70,),
            Text('Step 3 of 3 completed'),SizedBox(height: 10,),
            SizedBox(height: 10,),
            LinearProgressIndicator(
              backgroundColor: Colors.white70,
              valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
              minHeight: 10.0,
              value: 0.7,

            ), ],
        ),
      ),
    );
  }
}
