import 'package:flutter/material.dart';

const TextStyle priText = TextStyle(
    fontSize: 44,
    fontFamily: 'Cairo',
    fontWeight: FontWeight.bold,
    color: Color(0xffffffff)
);

const TextStyle itemCreatStyle=TextStyle(
fontWeight: FontWeight.bold,
fontSize: 15,
color: Color(0xa0fdfdfd)
);
const TextStyle catText=TextStyle(
  color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600
);
const head1=TextStyle(
  fontSize: 40,
  color: Color(0xFFFFFFFF),
  fontWeight: FontWeight.bold,
  fontFamily: 'Cairo'
);

final RegExp emailValidatorRegExp=
RegExp(r"^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//_____________________________________________________
const String kEmailNullError = "Please Enter your Email";
const String kNameNullError = "Please Enter your Name";
const String kPassNullError = "Please Enter your Password";
const String kPhoneNumberNullError = "Please Enter your Phone Number";
const String kAddressNullError = "Please Enter your Address";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Password Don't Match";


