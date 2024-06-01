import 'package:flutter/material.dart';

class UserModel{
  // late final name;
  late final email;
  late final password;
  UserModel({this.email,this.password});
  UserModel.formMap(Map<String, dynamic> map) {
    // name = map['name'];
    email = map['email'];
    password = map['password'];
  }
  Map<String ,dynamic> toMap(){
    return {
      // 'name'     : name,
      'email'    : email,
      'password' : password,
    };
  }
}