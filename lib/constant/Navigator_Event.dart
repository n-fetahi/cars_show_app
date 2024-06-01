
import 'package:flutter/material.dart';
import '../screen/SignInPage.dart';
import '../screen/Home.dart';
import '../screen/page1.dart';
import '../constant/Navigator_Event.dart';
import '../screen/CarDetails.dart';
Navi_Ev( pageName ,BuildContext context){
  Navigator.push(context,
      MaterialPageRoute(
          builder: (context){
            return pageName;
          })
  );
}