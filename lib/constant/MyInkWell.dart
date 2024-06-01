import 'package:flutter/material.dart';

Widget myInlWell(String text,Function() press){
  return InkWell(
    child: Text(text
    ,style: TextStyle(
        fontWeight: FontWeight.w700,
          color: Color(0xff2864da),
        fontSize: 20
      ),
    ),
    onTap: press,
  );
}