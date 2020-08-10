

import 'package:flutter/material.dart';
import 'package:hs/Provider/LoginCheckProvider.dart';
import 'package:hs/Provider/MainProvider.dart';
import 'package:hs/Provider/PageTwoProvider.dart';
import 'package:hs/viewModels/LoginCheck.dart';
import 'package:provider/provider.dart';



void main() =>runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<MainProvider>(create: (_) => new MainProvider(),),
      ChangeNotifierProvider<LoginCheckProvider>(create: (_) => new LoginCheckProvider()),
    ],
    child: MaterialApp(
      home: LoginCheck(),
    ),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //프로바이더는 context 밑에다
    MainProvider m = Provider.of<MainProvider>(context);
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [
          Text(m.value),
          RaisedButton(
              child: Text('버튼'),
              onPressed: (){
              m.value = "안녕히가세요";
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                create: (context) => new PageTwoProvider(),
                  child: new PageTwo()
              ),
              ),
              );
              })
        ],
      )
    );
  }
}


//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//
//  String data;
//
//  @override
//  void initState() {
//  data = '안녕하세요';
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Scaffold(
//      body: SingleChildScrollView(
//        child: Column(children: <Widget>[
//          Text(data),
////          Container(
////            color: Colors.amber,
////            height: 1000,
////          ),
//
//          RaisedButton(
//              child: Text('button'),
//
//              onPressed: (){
//                setState(() {
//                  data = '안녕히가세요';
//                });
//                Navigator.of(context).push(
//                  MaterialPageRoute(builder: (context) {
//                    return new PageTwo();
//                  })
//                );
//            return;
//          }),
//        ],),
//      ),
//    );
//  }
//}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  PageTwoProvider _pr = Provider.of<PageTwoProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Text(_pr.data?.toString() ?? "로딩 중"),
    );
  }
}

//class PageTwo extends StatefulWidget {
//  @override
//  _PageTwoState createState() => _PageTwoState();
//}
//
//class _PageTwoState extends State<PageTwo> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
////      appBar: AppBar(),
//      body: Container(
//        width: MediaQuery.of(context).size.width,
//        color: Colors.amber,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            MaterialButton(
//              child: Text('뒤로1'),
//              onPressed: () {
//                Navigator.of(context).pop();
//              }
//            ),
//            MaterialButton(
//              child: Text('세번째 이동'),
//              onPressed: () {
//                Navigator.of(context).pushReplacement(
//                    MaterialPageRoute(builder: (context) {
//                  return PageTh();
//                }));
//              }
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}


class PageTh extends StatefulWidget {
  @override
  _PageThState createState() => _PageThState();
}

class _PageThState extends State<PageTh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}


