import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_flixs_base/profile/profile.dart';
class Completed_Reg extends StatefulWidget {
  const Completed_Reg({Key? key}) : super(key: key);

  @override
  _Completed_RegState createState() => _Completed_RegState();
}

class _Completed_RegState extends State<Completed_Reg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Padding(
              padding: const EdgeInsets.fromLTRB(400, 0,0,0),
              child: Text('Profile Updated',style:GoogleFonts.alexBrush(
                textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.yellow,),),)
          ),SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(400, 0,0,0),
              child: OutlinedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(val: '  ',)));}, child: Text('Home')),
            ),SizedBox(height: 50,),
            Text('User update completed'),SizedBox(height: 10,),
            SizedBox(height: 10,),
            LinearProgressIndicator(
              backgroundColor: Colors.white70,
              valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
              minHeight: 10.0,
              value: 1,

            ),],

        ),
      ),
    );
  }
}
