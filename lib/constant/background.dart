import 'package:flutter/material.dart';

BoxDecoration backgroundApp(String path,double opacity) {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(path),
      fit: BoxFit.cover,
      opacity: opacity,


  ),
  );
}