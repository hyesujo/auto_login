import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hs/models/AirModel.dart';
import 'package:http/http.dart' as http;

class ServerLess extends StatefulWidget {
  @override
  _ServerLessState createState() => _ServerLessState();
}

class _ServerLessState extends State<ServerLess> {

  List<AirModel> datas;
  final String _url = "https://api.airtable.com/v0/appnONndril8CkBBb/Table%201?maxRecords=3&view=Grid%20view";

  Future<List> connect() async{
    Map<String,String> _header = {"Authorization" : "Bearer keyqj5yfd2py2bUpC"};
    http.Response _res = await http.get(_url, headers: _header);
    Map<String,dynamic> result = json.decode(_res.body);
    List lResult = result['records'];
    return lResult;
    //모델링
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ,
        builder: (BuildContext context,AsyncSnapshot<List> snap) {
          if(!snap.hasData) return CircularProgressIndicator();
          print(snap.data.toString());
          return ListView.builder(
            itemCount: snap.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title : Text(snap.data[index]['fields']['title'].toString()),
                );
              });
        },
      )
    );
  }
}
