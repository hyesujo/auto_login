import 'package:flutter/material.dart';

class DeepModel{
  String title;
  String src;
  String name;
  String des;

  DeepModel({this.title,this.src,this.des,this.name});

  factory DeepModel.toJson({@required Map<String, dynamic> e}){
    return new DeepModel(
      title: e["title"],
      des: e["des"],
      src: e["src"],
      name: e["name"]

    );
  }
}