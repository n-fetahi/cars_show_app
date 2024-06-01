import 'package:flutter/material.dart';

import '../screen/CarDetails.dart';
import '../screen/SignInPage.dart';
import '../screen/page1.dart';
import 'Navigator_Event.dart';
import 'SizeOfConfig.dart';
final List<int> sallah=[];
Widget ViewCurrent(String name , String img,int price,Color color,int index,BuildContext context) {
  SizeOfConfig().init(context);
  return GestureDetector(
    onTap: (){

        Navi_Ev(CarDetails(image: img,name: name,price: price,index: index,), context);

    },
    child: Container(

height: 380,
      // padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      decoration: BoxDecoration(
          color: color,

          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.23),
              blurRadius: 4,
              offset: const Offset(0, 0),

            )
          ]
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(10.0), //add border radius
              child: Image.asset(img,
                fit: BoxFit.cover,

                height: getheightScreen(250),
                // opacity:,
                width: getWidthScreen(310),

              ),
            ),
            SizedBox(height:20,),
            Column(
              children: [
                Text(name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Cairo'),
                ),

                Text("USD $price",
                    style: const TextStyle(
                        color: Color(0xff1b249a),
                        fontSize: 16,
                        fontWeight: FontWeight.w500)
                ),
                // GestureDetector(
                //   onTap: (){
                //     sallah.add(index);
                //   },
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text('اضافة الى السلة',
                //         style: TextStyle(
                //           color: Color(0xffb9132d),
                //           fontSize: 15,
                //           fontWeight: FontWeight.bold
                //         ),
                //       ),
                //       SizedBox(width: 5,),
                //       Icon(Icons.add_shopping_cart,color: Color(0xffb9132d),size: 30,
                //       ),
                //       SizedBox(width: 10,),
                //
                //     ],
                //   ),
                // )
              ],
            )

          ],
        ),
      ),
    ),
  );
}