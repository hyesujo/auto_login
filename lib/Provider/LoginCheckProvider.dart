import 'package:flutter/material.dart';
import 'package:hs/repo/connect_net.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCheckProvider with ChangeNotifier{

  bool result;

 Future<void> _init() async {
   //함수로 빼고 클래스 변수 최소화
   //로직을 구현
   const String _key = "login"; //원싯값은 const
  SharedPreferences _pref = await SharedPreferences.getInstance();
  // {}맵형
//  _pref.setBool("login", false);
//  _pref.getBool("login");
 bool _check = _pref.getBool(_key) ?? false;
 //했으면 -->Id/Pw ->net -> true || false
   //안했으면 -> 로그인페이

  await new ConnetNet().loginLogFetch();
//  return _check;
 this.result = _check;
 notifyListeners();
 return;
  }


  LoginCheckProvider(){
   Future.microtask(()async => await _init());
  }

  Future<void> logOut()async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    await _pref.clear();
   this.result = false;
   notifyListeners();
  }

  Future<void> logIn({@required id, @required pw})async {
    ConnetNet _con = new ConnetNet();
    bool _result = await _con.login(id : id, pw : pw);
    if(_result){
    SharedPreferences _pref =await SharedPreferences.getInstance();
    await _pref.setBool("login", true);
    this.result = true;
    notifyListeners();
  }
    return;
}
}