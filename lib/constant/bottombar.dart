import 'package:flutter/material.dart';
import '../constant/SizeOfConfig.dart';


class BottomBar extends StatelessWidget {
  final int ?BottomNu;
  final Function ?CallBack;
  const BottomBar({Key? key, this.BottomNu, this.CallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    // SizeOfConfig();
    final bottoms = [
      Icons.home_filled,
      Icons.shopping_cart,
      Icons.shopping_bag_outlined,
      Icons.person,
    ];
    return Container(
      color: Color(0xFF222226),
      child: SizedBox(
        width: SizeOfConfig.widthScreen,
        height: getheightScreen(60),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_,index)=>GestureDetector(
            child: Container(
              width: (SizeOfConfig.widthScreen-40)/4,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BottomNu==index?const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 10,
                    color: Color(0x90FFFFFF),
                  ),
                  top: BorderSide(
                    width: 3,
                    color: Color(0x90FFFFFF),
                  ),
                  left: BorderSide(
                    width: 3,
                    color: Color(0x90FFFFFF),
                  ),
                  right: BorderSide(
                    width: 3,
                    color: Color(0x90FFFFF2),
                  )
                )
              ):null,
              child: Icon(
                bottoms[index],
                size: BottomNu==index?35:30,
                color: BottomNu==index?Colors.white:Color(0xD5828485),
              ),
            ),
            onTap: ()=>CallBack!(index),
          ),
          separatorBuilder: (_,index)=>const SizedBox(width: 10,),
          itemCount: bottoms.length,
        ),

      ),
    );
  }
}


