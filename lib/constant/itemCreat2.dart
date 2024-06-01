import 'package:flutter/material.dart';

import 'constant.dart';

Widget ItemCreat2(String name, String img, int price) {
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      Container(
decoration: BoxDecoration(
  color: Color(0xc3020101),

borderRadius: BorderRadius.circular(15),
),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0), //add border radius
              child: Image.asset(
                img,
                height: 150,
                fit: BoxFit.cover,
                width: 200,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xa0fdfdfd)
                )
                ),
                SizedBox(height: 10,),
                Text('$price',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color(0xa0c42f52)
                ),
                ),

              ],
            )
            ],
        ),
      ),
    ],
  );
}
