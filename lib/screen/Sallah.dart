import 'package:fetahi_cars_show/screen/SignInPage.dart';
import 'package:fetahi_cars_show/screen/page1.dart';
import 'package:flutter/material.dart';

import '../constant/CreatItems.dart';
import '../constant/Navigator_Event.dart';
import '../constant/TitleApp.dart';
import '../constant/background.dart';
import '../constant/bottombar.dart';
import '../constant/constant.dart';
import '../constant/itemCreat2.dart';
import 'Home.dart';
class Sallah extends StatefulWidget {
   Sallah({Key? key, this.title, this.name, this.price, this.img}) : super(key: key);
  final String ?title;
  final String ?name;
   final String ?img;
   final String ?price;

  @override
  State<Sallah> createState() => _SallahState();
}

class _SallahState extends State<Sallah> {

  int bottomNum=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        BottomNu: 1,
        CallBack: (int index) {
          bottomNum = index;
          setState(() {
            if (bottomNum == 0) {
              Navi_Ev(Home(), context);
            } else if (bottomNum == 1) {
              // Navi_Ev(Sallah(), context);
            } else if (bottomNum == 2) {
              Navi_Ev(SignInPage(), context);
            } else if (bottomNum == 3) {
              Navi_Ev(Home(), context);
            }
          });
        },
      ),

      body: Container(
        height: double.infinity,
        decoration: backgroundApp('assets/images/c10.jpg', 0.4),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 5,right: 5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TitleApp('Sallah', context),

                      Column(
                        children:
                          sallah.map((int p) =>
                              ItemCreat2(products[p]['name'],products[p]['img'],products[p]['price']),
                          ).toList()
                      ),
                      SizedBox(height: 20,),
                      sallah.isNotEmpty?Container(
                        child: RaisedButton (
                            color: Color(0xA6000000),
                            shape: OutlineInputBorder(
                                borderSide: BorderSide.none,

                                borderRadius: BorderRadius.circular(30)),
                          onPressed: (){
                              sallah.clear();

                              Navi_Ev(Sallah(title:'Done' ,), context);


                          },
                          child: Text('Buy',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xa0fdfdfd)
                          ),
                          ),

                        ),
                        height: 50,
                        width: 170,
                      ):Column(
                        children: [
                          SizedBox(height: 200,),
                          Center(child: Text(widget.title!,style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
      // Column(
      //   children: [
      //       SizedBox(height: 50,),
      //     Container(
      //       height: double.infinity,
      //       color: Color(0xd3a18d8d),
      //       child: //ItemCreat2(),
      //       Expanded(
      //         child: GridView.builder(
      //             gridDelegate:
      //             const SliverGridDelegateWithMaxCrossAxisExtent(
      //                 maxCrossAxisExtent: 50,
      //                 // childAspectRatio: 1,
      //                 crossAxisSpacing: 5,
      //                 // mainAxisExtent: 350,
      //                 mainAxisSpacing: 10),
      //             itemCount: products.length,
      //             itemBuilder: (BuildContext ctx, index) {
      //               return ItemCreat2(
      //                   name: products[index]['name'],
      //                   img: products[index]['img'],
      //                   price: products[index]['price']
      //
      //                   // products[]['name'],
      //                   // products[index]['img'],
      //                   // products[index]['price'],);
      //               );
      //             }
      //
      //
      //         ),
      //       ),
      //     ),
      //   ],
      //
      // ),
    );
  }
}
