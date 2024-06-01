import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  TextForm({Key? key, this.lableText, this.myKey, required this.obscureText,
  this.icon, this.controller, this.validation, this.press, this.hint}) : super(key: key);
  final String ?lableText;
  final TextInputType ?myKey;
  late final bool obscureText;
  final IconData ?icon;
  final TextEditingController ?controller;
  final Function ?validation;
  final Function ?press;
  final String ?hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      keyboardType: myKey,
      validator: validation as String ? Function(String?),
      onChanged: press as void  Function(String?),
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(
        fontSize: 15,
        color: Color(0xFFFFFFFF),
        fontFamily: 'Cairo'
      ),
      decoration: InputDecoration(
        hintText: hint,
        labelText: lableText,
        labelStyle: const TextStyle(
          // fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Color(0xffffffff),

        ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              width: 5,
              color: Color(0xff9f7953),

            )
          ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
            width: 2,
          color: Color(0xffffffff),


        )
    ),
        suffixIcon: Icon(icon,color: Color(0xffffffff),
        ),
      ),
    );
  }
}
