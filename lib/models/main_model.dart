import 'package:flutter/material.dart';
import 'package:hs/models/deepmodel.dart';

class MainModel{
  String title;
  String src;
  List<DeepModel> data;

  MainModel({@required this.data,this.src,this.title})
  : assert(title !=null); //throw error

  //팩토리 메서드
 //자기 자신의 인스턴스를 생성하여 반환 ->
 factory MainModel.toJson({@required Map<String, dynamic> json}){
   return new MainModel(
       title:json["title"],
       src:json["src"],
       data: json["data"].map<DeepModel>((e) => DeepModel.toJson(e: e)).toList());
 }
}