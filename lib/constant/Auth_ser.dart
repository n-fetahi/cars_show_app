import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../screen/Home.dart';
import 'Navigator_Event.dart';

class AuthSer{
  signInWithGoogle(BuildContext context)async{
    final GoogleSignInAccount ?googleUser=
        await GoogleSignIn(
          scopes: <String>['email']
        ).signIn();
    final GoogleSignInAuthentication googleAuth=
        await googleUser!.authentication;
    final credential=GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );
    Navi_Ev(Home(), context);
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }
  signOutwithGoogle(){
    FirebaseAuth.instance.signOut();
  }

  FaceBookLogin()async{
    try{
      final result=FacebookAuth.instance.login(
        permissions: ['email','public_profile']
      );
      if(result==LoginStatus.success){
        final userData= await FacebookAuth.instance.getUserData();
        print("secc");
      }
    }catch(e){
      print(e);
    }

  }


}