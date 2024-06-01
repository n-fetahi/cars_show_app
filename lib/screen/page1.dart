import 'package:flutter/material.dart';
import '../constant/CreatItems.dart';
import '../constant/Navigator_Event.dart';
import '../constant/SizeOfConfig.dart';
import '../constant/TitleApp.dart';
import '../constant/background.dart';
import '../constant/bottombar.dart';
import 'Home.dart';
import 'Sallah.dart';

class ViewItems extends StatefulWidget {
  ViewItems({Key? key,required this.img,required this.name,required this.price,required this.bottomNum}) : super(key: key);
  late final String img;
  late final String name;
  late final int price;
  late  var bottomNum;

  @override
  State<ViewItems> createState() => _ViewItemsState();
}

class _ViewItemsState extends State<ViewItems> {


  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      // bottomNavigationBar: BottomBar(
      //   BottomNu: widget.bottomNum,
      //   CallBack: (int index){
      //     widget.bottomNum=index;
      //     setState((){
      //       if(widget.bottomNum==0){
      //         Navi_Ev(Home(),context);
      //       }
      //       else if(widget.bottomNum==1){
      //         Navi_Ev(Sallah(title: 'No Items Found',), context);
      //       }
      //       else if(widget.bottomNum==2){
      //         Navi_Ev(Home(),context);
      //       }
      //       else if(widget.bottomNum==3){
      //         Navi_Ev(Home(),context);
      //       }
      //     });
      //
      //   },
      // ),
      // backgroundColor: Colors.black,
      body: Container(

        decoration: backgroundApp('assets/images/c10.jpg',0.4),
    child: SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6, right: 6,bottom: 3),
            child: Column(
              children: [
                TitleApp(widget.name,context),
                SizedBox(height: 10,),
                ViewCurrent('',widget.img,widget.price,Color(0xd3ffffff),0,context)

              ],
            ),
          ),

        ],
      )
    ),
      ),
    );
  }
}
