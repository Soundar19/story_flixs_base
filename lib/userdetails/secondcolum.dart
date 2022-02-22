import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:story_flixs_base/userdetails/thirdcoloum.dart';

class Stage2 extends StatefulWidget {
  const Stage2({Key? key}) : super(key: key);


  @override
  _Stage2State createState() => _Stage2State();
}

class _Stage2State extends State<Stage2> {
  String title = '';
  DateTime date = DateTime.now();




  Future<Null> selectDate(BuildContext context) async {
    DateTime? datepicker = await showDatePicker(
      context: context,
        initialDate: date,
        firstDate: DateTime(1947),
        lastDate: date.add(new Duration(days: 2),)
    );
    if(datepicker != null && datepicker !=date){
      setState(() {
        date=datepicker;

      });
    }
  }
  TextEditingController dateofbirth =  TextEditingController();
  TextEditingController phone =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dbRef1 = FirebaseDatabase.instance.ref();
    var formate1 = "${date.day}-${date.month}-${date.year}";
    final DOB = TextFormField(
      onTap:(){
        setState(() {
          selectDate(context);
        });
      } ,
        autofocus: false,
        controller: TextEditingController()..text=formate1,
        keyboardType: TextInputType.datetime,
        // onSaved: (value) {
        //   first = value!;
        // },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.date_range_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          filled: true,
          fillColor: Colors.orangeAccent,
          hintText: '00/00/0000',
        ));

    final Phonenumber = TextFormField(
        autofocus: false,
        controller: phone,
        // obscureText: true,
        // onSaved: (value) {
        //   last=value!;
        // },
        // onSaved: (value) {
        //   passwordEditingController.text = value!;
        // },
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          filled: true,
          fillColor: Colors.orangeAccent,
          hintText: 'enter phone number',
        ));
    return Scaffold(
      appBar: AppBar(
        title: Text("coloum 1"),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 00, 40,0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            DOB,
            SizedBox(
              height: 20,
            ),
            Phonenumber,
            SizedBox(
              height: 30,
            ),
            RaisedButton(
                onPressed: () {
                  setState(() {
                    selectDate(context);
                  });
                },
                color: Colors.white30,
                child: Text('Date')),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Previous')),SizedBox(width: 30,),
                ElevatedButton(
                    onPressed: () async {
                      var tableRef1 = dbRef1.child('Userdata2');
                      await tableRef1.child('dob & phone no').set({
                        'DOB':formate1,
                        'phone no': phone.text,
                      });

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Stage3()));
                    },
                    child: Text('Next')),
              ],
            ),
            SizedBox(height: 70,),
            Text('Step 2 of 3 completed'),SizedBox(height: 10,),
            SizedBox(height: 10,),
            LinearProgressIndicator(
              backgroundColor: Colors.white70,
              valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
              minHeight: 10.0,
              value: 0.3,

            ),
          ],
        ),
      ),
    );
  }

}
