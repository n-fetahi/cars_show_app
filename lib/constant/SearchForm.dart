import 'package:fetahi_cars_show/screen/Home.dart';
import 'package:fetahi_cars_show/screen/SignInPage.dart';
import 'package:flutter/material.dart';

import '../Local_Db/DbControll/DbControll.dart';
import '../Local_Db/Model_User/itemsModel.dart';
import '../screen/page1.dart';
import 'Navigator_Event.dart';
 bool flage=false;
 int cur=0;
class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  @override
  var vald;
  var dbControll;

  void initState(){
    super.initState();
    dbControll=DbControll();
  }
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 5,bottom: 5),

        // width: 20,
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
      children: [
          Container(
            width: 300,
            child: TextFormField(

              onChanged: (value){
                vald=value.toString();
              },
                keyboardType: TextInputType.text,
                // validator: validation as String ? Function(String?),
                // onChanged: press as void  Function(String?),
                // controller: controller,
                // obscureText: obscureText,
                style: const TextStyle(
                    fontSize: 15, color: Color(0xFFFFFFFF), fontFamily: 'Cairo',

                ),

                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'Search ...',
                  hintStyle: const TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xffffffff),
                  ),

                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Color(0xFFFFFFFF),
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color(0xffffffff),
                      )
                  ),

                )),
          ),
          SizedBox(width: 10,),
          Container(

            // margin: EdgeInsets.only(left: 5),
            child: RaisedButton(
            color: Color(0xFF2F2E2E),
              shape: OutlineInputBorder(
                  borderSide: BorderSide.none,

                  borderRadius: BorderRadius.circular(30)),
              // onPressed: onPress as void Function(),
              // color: bac,
              onPressed: () async{
                var sec;
                  ItemsModel uModel=ItemsModel();
                 sec=  await dbControll.fetchAllItems().then((userData){
                  select=userData;
                  print(ItemsModel.formMap(select[0]).name);

                  // var res=ItemsModel.formMap(userData[0]);
                }).catchError((error)async{
                  print(error);
                });

                for(int i=0;i< 8;i++){
                if(ItemsModel.formMap(select[i]).name==vald.toString()){
                  flage=true;
                  cur=i;
                  Navi_Ev(Home(),context);
                  break;
                }
                else{
                  flage=false;
                  cur=0;
                }

              }

                  Navi_Ev(Home(),context);

              },
              child: Icon( Icons.search,size: 30,color: Color(0xFFFFFFFF),),
            ),
            height: 55,
            width: 60,
          )
      ],
    ),
        ));
  }
}
