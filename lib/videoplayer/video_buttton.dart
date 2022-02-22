
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'package:story_flixs_base/videoplayer/comment.dart';

class Vbutton extends StatefulWidget {
  const Vbutton({Key? key}) : super(key: key);

  @override
  _VbuttonState createState() => _VbuttonState();
}

class _VbuttonState extends State<Vbutton> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  bool lik = false;
  int likecount = 0;
  bool dlik = true;
  int dikecount = 0;
  // List<bool> isSelected = List.generate(2, (index) => false);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        LikeButton(
          size: 40,
          likeCount: likecount,
          isLiked: lik,
          likeBuilder: (isLiked) {
            final color = isLiked ? Colors.red : Colors.white60;
            return Icon(
              Icons.favorite,
              color: color,
            );
          },
          countBuilder: (likeCount, isLiked, text) {
            final color = Colors.white30;

          },
        ),
        SizedBox(
          width: 10,
        ),
        LikeButton(
          size: 20,
          likeCount: dikecount,
          isLiked: dlik,
          likeBuilder: (isLiked) {
            final color = isLiked ? Colors.white30 : Colors.red;
            return ImageIcon(
              const AssetImage(
                "assets/broken-heart (1).png",
              ),
              color: color,
              size: 40,
            );
          },
        ),
        SizedBox(width: 20,),
        IconButton(onPressed: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentPost()));

          }, icon: Icon(Icons.comment,color: Colors.white70,)),  SizedBox(width: 30,),
        IconButton(onPressed: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentPost()));

        }, icon: Icon(Icons.share_rounded,color: Colors.white70,))
      ],
      // child: ToggleButtons(
      //   isSelected: isSelected,
      //   color: Colors.black,
      //   selectedColor: Colors.red,
      //   fillColor: Colors.red,
      //   renderBorder: false,
      //   borderRadius: BorderRadius.circular(15),
      //   children: [
      //     Container(height: 30,width: 30,child: Image.asset('assets/heart.png')),
      //     Container(height: 30,width: 30,child: Image.asset('assets/broken-heart.png')),
      //   ],
      //   onPressed: (int newIndexx) {
      //     setState(() {
      //       for (int index = 0; index < isSelected.length; index++) {
      //         if (index == newIndexx) {
      //           isSelected[index] = true;
      //         } else {
      //           isSelected[index] = false;
      //         }
      //       }
      //     });
      //   },
      // ),
    );
  }
}
