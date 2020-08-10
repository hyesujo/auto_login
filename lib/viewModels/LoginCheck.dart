import 'package:flutter/material.dart';
import 'package:hs/LodingPage.dart';
import 'package:hs/LoginPage.dart';
import 'package:hs/Provider/LoginCheckProvider.dart';
import 'package:hs/mainpage.dart';
import 'package:hs/repo/connect_net.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   LoginCheckProvider _lc = Provider.of<LoginCheckProvider>(context);
  return  _lc.result == null
       ? LodingPage()
       : _lc.result
      ? new MainPage()
       : new LoginPage();
  }
}



//class LoginCheck extends StatefulWidget {
//  @override
//  _LoginCheckState createState() => _LoginCheckState();
//}
//
//class _LoginCheckState extends State<LoginCheck> {
//
//  //shared, low Db - 임시파일 - 자동로그인체크(버튼에 대한 확인)
//  //local Db - sqflite - nonsql(json) -토큰
//  //로그인 다시 (로직으로서)
// //페이지전에 로그인체크
//@override
//  void initState() {
////   Future(() async => print(await fetch()));
//    super.initState();
//  }
//
// Future<bool> fetch() async {
//   //함수로 빼고 클래스 변수 최소화
//   //로직을 구현
//   const String _key = "login"; //원싯값은 const
//  SharedPreferences _pref = await SharedPreferences.getInstance();
//  // {}맵형
////  _pref.setBool("login", false);
////  _pref.getBool("login");
// bool _check = _pref.getBool(_key) ?? false;
// //했으면 -->Id/Pw ->net -> true || false
//   //안했으면 -> 로그인페이
//
//  await new ConnetNet().loginLogFetch();
//  return _check;
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    return FutureBuilder(
//      future: this.fetch(), //퓨쳐에서 쓴 값을 빌더에서 담아줌
//      builder: (BuildContext context,AsyncSnapshot<bool> snap){
//        if(!snap.hasData) return new LodingPage(); //있냐없냐를 불값으로 반환해줌
//         if(snap.data) return new MainPage(wstate: setState); //로그인 시도 로직 구현
//        return new LoginPage(wState: setState);
//      },
//    );
//  }
//}
