import 'package:fetahi_cars_show/screen/SignInPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../constant/Navigator_Event.dart';
import '../constant/BottomItem.dart';
import '../constant/myButton.dart';
import '../constant/SizeOfConfig.dart';
import '../constant/background.dart';
import 'SignUpPage.dart';


class Movement extends StatefulWidget {
  const Movement({Key? key}) : super(key: key);

  @override
  State<Movement> createState() => _MovementState();
}

class _MovementState extends State<Movement> {
  
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);

    return Scaffold(
      body:Container(
        decoration: backgroundApp('assets/images/c10.jpg',1),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   // crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     // Text("Welcome to",
              //     //
              //     //   style: TextStyle(
              //     //       fontSize: 20,
              //     //
              //     //       fontFamily: 'Cairo',
              //     //       color: Colors.white
              //     //   ),
              //     // ),
              //     SizedBox(
              //       height: 10,
              //     ),
              //     Text(" FETAHI CARS SHOW",
              //       style: TextStyle(
              //           fontSize: 40,
              //           fontFamily: 'Cairo',
              //           color: Color(0xffffffff),
              //         fontWeight: FontWeight.bold
              //       ),
              //     ),
              //   ],
              // ),

              SizedBox(
                height: 450,
              ),
              myButton('Sign In',Colors.white,Color(0xff514539),(){
                Navi_Ev(SignInPage(),context);
              },context),
              myButton('Sign Up',Color(0xff514539),Colors.white,(){
                Navi_Ev(SignUpPage(),context);

              },context),
              SizedBox(
                height: 60,
              ),

            ],

          ),
        )
      ),

    );
  }


}

