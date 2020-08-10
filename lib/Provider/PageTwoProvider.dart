import 'package:flutter/material.dart';
import 'package:hs/models/main_model.dart';
import 'package:hs/repo/connect_net.dart';

class PageTwoProvider with ChangeNotifier{

 List<MainModel> data;

 Future<void> _init() async{
  data = await new ConnetNet().fetchGetData();
  notifyListeners();
  return;
 }
 PageTwoProvider() {
   Future.microtask(() async=> await _init());
 }

}