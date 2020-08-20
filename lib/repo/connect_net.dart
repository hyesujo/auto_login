import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hs/models/main_model.dart';
import 'package:http/http.dart' as http;

class ConnetNet {
   static const String _url ="http://127.0.0.1:3000";

  Future fetchBasic() async {
    http.Response _res; //전역변수
    try{
      http.Response _res = await http.get(_url).timeout(new Duration(seconds: 8),
          onTimeout: ()async {
        return new http.Response("false",500);
      });
    }
    catch(e) {
    }
    print(_res.body);
    bool result = json.decode(_res.body);
    print(result);
    return;
  }

  //주소1/주소2 ->주소1/주소2 ||/주소1/
  Future fetchPath({@required String path }) async {
    http.Response res = await http.get('$_url$path');
    print(res.body);
    bool result = json.decode(res.body);
    print(result);
    return;
  }

  Future fetchPostDatas() async {
    http.Response res =  await http.post('$_url/datas');
    List result = json.decode(res.body);
    print(result);
  }

  Future<List<MainModel>> fetchGetData() async {
    http.Response res =  await http.get('$_url/datas');
    List result = json.decode(res.body);
    return result.map<MainModel>((e)=> MainModel.toJson(json: e)).toList();
  }

  Future<void> loginLogFetch() async => await http.post("$_url/loginlog");

  Future<bool> login({@required String id,@required String pw}) async {
   http.Response _res = await http.post("$_url/login", body:{'id' : id, 'pw':pw});
   bool _result =  json.decode(_res.body);
    return _result;
  }

//  Future<void> loginLogFetch() async {
//   http.Response _res = await http.post("$_url/loginlog");
//   return;
  }

 //const x ->static