import 'package:fetahi_cars_show/Local_Db/DbControll/DbControll.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../Local_Db/Model_User/UserModel.dart';
import '../constant/Auth_ser.dart';
import '../constant/BottomItem.dart';
import '../constant/DefultBotton.dart';
import '../constant/FromError.dart';
import '../constant/MyInkWell.dart';
import '../constant/Navigator_Event.dart';
import '../constant/TextForm.dart';
import '../constant/background.dart';
import '../constant/constant.dart';
import '../constant/myButton.dart';
import '../firebase_options.dart';
import 'SignInPage.dart';
import 'Home.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailControll=TextEditingController();
  final passwordControll=TextEditingController();
  void dispose(){
    emailControll.dispose();
    passwordControll.dispose();
    super.dispose();
  }
  var email;
  var password;
  final _formKey=GlobalKey<FormState>();

  final List<String> errors=[];
  var dbControll;
  void initState(){
    super.initState();
    dbControll=DbControll();
  }
  void addError({String? error}){
    if (!errors.contains(error!))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}){
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  signIn()async{

    final vaildet=_formKey.currentState!.validate();
    if(!vaildet) return ;
    {showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context)=>Center(
          child: CircularProgressIndicator(),
        ));

    }


    try{
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp( );
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                 email: emailControll.text.trim(),
          password: passwordControll.text.trim());
      Navi_Ev(Home(), context);

    }on FirebaseAuthException catch(e){
      print('mmm');

      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Color(0xff000000),
        body: Container(
          decoration: backgroundApp('assets/images/c10.jpg',0.4),
          child: SafeArea(
            child: Stack(
              children: [
                Padding(padding: EdgeInsets.only(left: 16,right: 16,bottom: 60),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 50,),
                        Text('Sign Up' ,style: head1,),
                        SizedBox(height: 50,),
                        TextForm(
                          icon: Icons.email,
                          obscureText: false,
                          controller: emailControll,
                          myKey: TextInputType.emailAddress,
                          lableText: 'Email',
                          validation: (value){
                            if (value!.isEmpty){
                              addError(error: kEmailNullError);
                              return "";
                            }
                            else if (!emailValidatorRegExp.hasMatch(value)){
                              addError(error: kInvalidEmailError);
                              return "";
                            }
                            return null;
                          },
                          press: (value){

                            if (value.isNotEmpty){
                              removeError(error: kEmailNullError);
                            }
                            else if (emailValidatorRegExp.hasMatch(value)){
                              removeError(error: kInvalidEmailError);
                            }
                            email=value;
                          },
                        ),

                        SizedBox(height: 50,),
                        TextForm(
                          icon: Icons.visibility_off,
                          obscureText: true,
                          controller: passwordControll,
                          myKey: TextInputType.text,
                          lableText: 'Password',
                          validation: (value){
                            if(value!.isEmpty){
                              addError(error: kPassNullError);
                              return "";
                            }
                            else if(value.length<8){
                              addError(error: kShortPassError);
                              return "";
                            }
                            return null;
                          },
                          press: (value){
                            if(value.isNotEmpty){
                              removeError(error: kPassNullError);
                            }
                            else if(value.length >= 8){
                              removeError(error: kShortPassError);
                            }
                            password=value;
                          },
                        ),
                        SizedBox(height: 50,),
                        FormError(errors: errors,),
                        SizedBox(height: 50,),
                        myButton('Sign Up',Colors.white,Color(0xff514539),()async{
                          // if(_formKey.currentState!.validate()){
                          //   _formKey.currentState!.save();
                          // }
                          setState((){
                            signIn();
                          });
                        },context),

                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("If you don't have an Account ?",
                              style: TextStyle(
                                color: Color(0xfff8f8f8),
                                fontSize: 18,

                              ),
                            ),
                            myInlWell(" Sign In", (){
                              Navi_Ev(SignInPage(), context);
                            }),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text("Remember me",
                        //       style: TextStyle(
                        //         color: Color(0xfff8f8f8),
                        //         fontSize: 18,
                        //       ),
                        //     ),
                        //     myInlWell(" save", ()async{
                        //       if(_formKey.currentState!.validate()){
                        //         _formKey.currentState!.save();
                        //         print('----------------------------');
                        //         UserModel uModel=UserModel(email: email,password: password);
                        //         await dbControll.saveData(uModel).then((userData){
                        //           print('sec');
                        //           Navi_Ev(Home(), context);
                        //
                        //         }).catchError((error)async{
                        //           print(error);
                        //         });
                        //       }else{
                        //         print('----------------------------');
                        //       }
                        //     })
                        //   ],
                        // ),
                        Text('OR',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Cairo',
                              color: Colors.white
                          ),
                        ),
                        SizedBox(height: 20,),
                        ButtonItem('assets/SvgPicture/icons8-facebook.svg','Continue with facebook',30,()async{
                          FacebookAuth.instance.login(
                              permissions: ["public_profile", "email"]).then((value) {
                            FacebookAuth.instance.getUserData().then((result) {
                              setState(() {
                                AuthSer().FaceBookLogin();
                                // _isLoggedIn = true;
                                // _user = result;
                              });
                            });
                          });
                        },context),
                        SizedBox(height: 20,),
                        ButtonItem('assets/SvgPicture/icons8-google.svg','Continue with Google' , 30, () {

                          setState((){
                            AuthSer().signInWithGoogle(context);
                            // Navigator.push(context,
                            //     MaterialPageRoute(
                            //         builder: (context){
                            //           return Home();
                            //         })
                            // );
                          });
                        }, context),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
