
import 'package:fetahi_cars_show/constant/SizeOfConfig.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

Widget ButtonItem(
String imagePath, String buttonName,
double size,Function() onTap,
BuildContext context
){
  SizeOfConfig().init(context);
  return InkWell(
    onTap: onTap,
    child: Container(
      width: SizeOfConfig.widthScreen-60,
      height: 70,
      child: Card(
        //3D
        elevation: 8,
        color: Color(0xff514539),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
          side: const BorderSide(
            width: 1,
            color: Colors.grey
          )
        ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           SvgPicture.asset(
             imagePath,
             height: size,
             width: size,
           ),
           SizedBox(
             width: 15,
           ),
           Text(
             buttonName,
             style: const TextStyle(
               color: Colors.white,
               fontSize: 17,
               fontFamily: 'Cairo'
             ),
           )
         ],
       ),
      ),
    ),
  );
}