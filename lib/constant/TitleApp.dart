import 'package:flutter/material.dart';
import '../screen/Home.dart';
import '../screen/SignInPage.dart';
import '../screen/SignUpPage.dart';
import 'Navigator_Event.dart';
import 'constant.dart';

Widget TitleApp( String title,BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 10,
      ),
      GestureDetector(
        onTap: (){

        },
        child: InkWell(
          child: Icon(Icons.arrow_back_rounded),
          onTap: (){
            Navi_Ev(SignUpPage(), context);
          },
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Center(
        child:
        Text(title,style: priText),

      ),
      SizedBox(
        height: 15,
      ),

    ],
  );
}