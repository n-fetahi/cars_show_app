import 'package:flutter/material.dart';

class ItemsModel{
  late final id;
  late final name;
  late final  img;
  late final price;
  ItemsModel({this.id,this.name,this.img,this.price});
    ItemsModel.formMap(Map<String, dynamic> map) {
     id = map['id'];
    name = map['name'];
    img = map['img'];
    price = map['price'];

  }
  Map<String ,dynamic> toMap(){
    return {
      // 'name'     : name,
      'id'  : id,
      'name'    : name,
      'img'    : img,
      'price' : price,
    };
  }
}