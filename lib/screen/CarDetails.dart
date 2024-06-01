import 'dart:ffi';

import 'package:fetahi_cars_show/screen/SignUpPage.dart';
import 'package:flutter/material.dart';

import '../constant/CreatItems.dart';
import '../constant/Navigator_Event.dart';
import '../constant/SizeOfConfig.dart';
import '../constant/background.dart';
import '../constant/DefultBotton.dart';
import 'Sallah.dart';
var total;
var t;
class CarDetails extends StatefulWidget {
  CarDetails({Key? key,required this.image,required this.name,required this.price,required this.index}) : super(key: key);
  late final String image;
  late final String name;
  late final int price;
  late final int index;

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: backgroundApp('assets/images/c10.jpg',0.4),
        child: SafeArea(
          child: Stack(
            children: [
               Container(
                  color: Color(0xa8ffffff),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: getheightScreen(10),),

                        InkWell(
                          child: Icon(Icons.arrow_back_rounded,size: 40,),
                          onTap: (){
                            Navi_Ev(SignUpPage(), context);
                          },

                        ),
                        SizedBox(height: getheightScreen(10),),
                        ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                          topLeft:Radius.circular(0)), //add border radius
                          child: Image.asset(widget.image,
                            fit: BoxFit.cover,
                            height: getheightScreen(280),
                            // opacity:,
                            width: getWidthScreen(315),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: getWidthScreen(10),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(widget.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,

                                      ),
                                      ),
                                      // SizedBox(width: getWidthScreen(225),),

                                      Text('\$'+widget.price.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,

                                          )),

                                    ],
                                  ),
                              SizedBox(height: getheightScreen(20),),
                              Row(
                                children: [
                                  SizedBox(width: getWidthScreen(10),),
                                  InkWell(
                                    onTap: (){
                                      count--;
                                    },
                                    child: Icon(Icons.remove,size: 30,),
                                  ),
                                  SizedBox(width: getWidthScreen(10),),

                                  Container(
                                    width: getWidthScreen(50),
                                    height: getheightScreen(40),
                                    child: TextFormField(
                                      onChanged: (value){
                                        value=(count++).toString();
                                      },
                                      onTap: (){
                                        count++;
                                      },
                                      enabled: false,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(left: 25,),
                                        hintText: '$count',
                                        hintStyle: const TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff000000),
                                      ),
                                        border:OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              width: 3,
                                              color: Color(0xFFFFFFFF),
                                            )
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: getWidthScreen(10),),
                                  InkWell(
                                    onTap: (){
                                      count++;
                                    },
                                    child: Icon(Icons.add,size: 30,),
                                  ),
                                  SizedBox(width: 30,),
                                  Container(
                                    width: getWidthScreen(130),
                                    height: getheightScreen(40),
                                    child: TextFormField(
                                      onChanged: (value){
                                        value=(count++).toString();
                                      },
                                      onTap: (){
                                        count++;
                                      },
                                      enabled: false,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(left: 25,),
                                        hintText: '\$'+(count*widget.price).toString(),
                                        hintStyle: const TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff000000),
                                        ),
                                        border:OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              width: 3,
                                              color: Color(0xFFFFFFFF),
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: getheightScreen(20),),
                              ListTile(
                                title: Text('Product Details',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                                trailing: Icon(Icons.arrow_drop_down),
                              ),
                              SizedBox(height: getheightScreen(10),),

                              ListTile(
                                title: Text('Nutritions',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                trailing: Icon(Icons.arrow_drop_down),
                              ),
                              SizedBox(height: getheightScreen(10),),
                              ListTile(
                                title: Text('Review',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                trailing: Icon(Icons.arrow_drop_down),
                              ),
                              SizedBox(height: getheightScreen(40),),

                              DefultButton("Add To Basket",(){
                                sallah.add(widget.index);
                                // Sallah(name: widget.name,price: widget.price,img: widget.image,);
                                // Navi_Ev(SignInPage(), context);

                              })

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
