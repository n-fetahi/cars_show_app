import 'package:fetahi_cars_show/screen/SignInPage.dart';
import 'package:flutter/material.dart';

Widget myButton (String name , Color txtColor,Color backColor,Function() onPress,BuildContext context){
  return Container(
    margin: EdgeInsets.all(15),
    child: RaisedButton(
      shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20)
      ),
      onPressed: onPress as void Function(),
      color: backColor,
      child: Text(name,
        style: TextStyle(
          color: txtColor,
          fontSize: 20,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold
        ),
      ),
    ),
    height: 55,
    width: 320,

  );
}