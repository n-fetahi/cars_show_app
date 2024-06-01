import 'package:fetahi_cars_show/constant/SizeOfConfig.dart';
import 'package:fetahi_cars_show/screen/Sallah.dart';
import 'package:fetahi_cars_show/screen/SignInPage.dart';
import 'package:flutter/material.dart';
import '../Local_Db/DbControll/DbControll.dart';
import '../Local_Db/Model_User/UserModel.dart';
import '../Local_Db/Model_User/itemsModel.dart';
import '../constant/CreatItems.dart';
import '../constant/Navigator_Event.dart';
import '../constant/SearchForm.dart';
import '../constant/TitleApp.dart';
import '../constant/background.dart';

// import '../constant/bottombar.dart';
import '../constant/bottombar.dart';

import 'page1.dart';
var select;
var c=0;
final List<Map> products = [
  {
    "ID": 1,
    "name": "Hundai Tucson",
    "img": "assets/newcars/hundaitucson.jpg",
    "price":  3280
  },
  {
    "ID": 2,
    "name": "Hyundai Accent",
    "img": "assets/newcars/hyundaiaccent.jpg",
    "price":  2390
  },
  {
    "ID": 3,
    "name": "Hyundai Sonata",
    "img": "assets/newcars/hyundaisonata.jpg",
    "price": 2880
  },
  {
    "ID": 4,
    "name": "Kia Sol",
    "img": "assets/newcars/keasol.jpg",
    "price": 3200
  },
  {
    "ID": 5,
    "name": "Kia Morning",
    "img": "assets/newcars/kiamorning.jpg",
    "price":  4700
  },
  {
    "ID": 6,
    "name": "Toyota Corolla",
    "img": "assets/newcars/toyotacorolla.jpg",
    "price": 5800
  },
  {
    "ID": 7,
    "name": "Toyota FG",
    "img": "assets/newcars/toyotafg.jpg",
    "price":  3540
  },
  {
    "ID": 8,
    "name": "Toyota Yaris",
    "img": "assets/newcars/toyotayaris.jpg",
    "price": 845
  },
];
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var dbControll;

  void initState(){
    super.initState();
    dbControll=DbControll();
  }

  var bottomNum = 0;

  @override
  Widget build(BuildContext context) {
  // if(true){
  //   ItemsModel uModel=ItemsModel();
  // select=   dbControll.fetchAllItems('Hundai Tucson').then((userData){
  //   select=userData;
  //
  //   // var res=ItemsModel.formMap(userData[0]);
  // }).catchError((error)async{
  //   print(error);
  // });
    // }

    SizeOfConfig().init(context);
    return Scaffold(
      bottomNavigationBar: SingleChildScrollView(
        child: BottomBar(
          BottomNu: 0,
          CallBack: (int index) {
            bottomNum = index;
            setState(() {
              if (bottomNum == 0) {
                Navi_Ev(Home(), context);
              } else if (bottomNum == 1) {
                Navi_Ev(Sallah(title: 'No Items Found',), context);
              } else if (bottomNum == 2) {
                Navi_Ev(Home(), context);
              } else if (bottomNum == 3) {
                Navi_Ev(Home(), context);
              }
            });
          },
        ),
      ),
      body:
      Container(
        decoration: backgroundApp('assets/images/c10.jpg', 0.4),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 6, right: 6, bottom: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    TitleApp('Home', context),
                    InkWell(
                      onTap: ()async{

                        print('----------------------------');
                        print('');
                        for(int i=3;i<8;i++){
                          print('----------------------------');
                        ItemsModel uModel=ItemsModel(
                            id:products[i]['ID'],
                            name:products[i]['name'].toString(),
                            img: products[i]['img'].toString(),
                            price:products[i]['price']);
                        await dbControll.saveDataItems(uModel).then((userData){
                          print('sec');
                          // Navi_Ev(SignInPage(), context);

                        }).catchError((error)async{
                          print(error);
                        });}
                      },
                      child: Text('Save',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.blueAccent
                          )),
                    ),
                    // RaisedButton(onPressed: onPressed)

                    SearchForm(),
                    SizedBox(
                      height: 10,
                    ),
                    flage==false?Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 450,
                                  // childAspectRatio: 1,
                                  crossAxisSpacing: 5,
                                  // mainAxisExtent: 350,
                                  mainAxisSpacing: 10),
                          itemCount: products.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return ViewCurrent(
                                products[index]['name'],
                                products[index]['img'],
                                products[index]['price'],
                                Color(0xd3ffffff),index,
                                ctx);

                          }


                          ),
                    ):ViewCurrent(
                        products[cur]['name'],
                        products[cur]['img'],
                        products[cur]['price'],
                        Color(0xd3ffffff),0,
                        context),


                  ],

                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomBar(),
    );

  }

}
