import 'package:flutter/material.dart';

import 'SizeOfConfig.dart';

class FormError extends StatelessWidget {
  final List <String?> errors;
  const FormError({
    Key? key,
    required this.errors

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Column(
      children:
      List.generate(errors.length, (index) =>formErrorText(error: errors[index]!))
    );
  }
  Row formErrorText({required String error}){

    return Row(
      children: [
        SizedBox(
          width: getheightScreen(14),
        ),
        SizedBox(
          width: getheightScreen(14),
        ),
        Text(error ,
        style: TextStyle(
          color: Color(0xFDF50000),
          fontSize: 17
        ),)
      ],
    );
  }
}
