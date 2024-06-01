import 'package:fetahi_cars_show/screen/Movement.dart';
import 'package:fetahi_cars_show/screen/SignInPage.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
// import 'sha';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);
  final List<PageViewModel> pages=[
        PageViewModel(
          title: 'مرحبا بكم في تطبيق السيارات',
          body: 'welcome to the Cars App',
          image: Center(
            child: Lottie.asset('assets/Shop_lottie/cr1.json'),
          ),
          decoration: const PageDecoration(
            bodyFlex: 1,
            imageFlex: 2,
            titleTextStyle: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
          )
        ),
    PageViewModel(
        title: 'يقوم التطبيق بعرض السيارات ',
        body: 'كونها من اكثر المنتجات طلبا بالسوق',
        image: Center(
          child: Lottie.asset('assets/Shop_lottie/cr2.json'),
        ),
        decoration: const PageDecoration(
            bodyFlex: 1,
            imageFlex: 2,
            titleTextStyle: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
        )
    ),
    PageViewModel(
        title: 'تعرض جميع السيارات واسعارها',
        body: 'وذلك لمساعدة الزبون على المفاضلة في الاسعار بما يناسبه',
        image: Center(
          child: Lottie.asset('assets/Shop_lottie/cr3.json'),
        ),
        decoration: const PageDecoration(
            bodyFlex: 1,
            imageFlex: 2,
            titleTextStyle: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
        )
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: IntroductionScreen(

          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Colors.black,
            activeSize: Size.square(20),
            activeColor: Colors.blue
          ),
          showDoneButton: true,
          done: const Text('Done'),
          showSkipButton: true,
          skip: const Text('Skip'),
          showNextButton: true,
          next: const Icon(Icons.arrow_forward,size: 30,),
          onDone: ()=>OnDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }
  void OnDone(context) async{
  Navigator.pushReplacement(context,
  MaterialPageRoute(builder: (context)=>const Movement())
  );
  }
}
