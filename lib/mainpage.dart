
import 'package:flutter/material.dart';
import 'package:hs/Provider/LoginCheckProvider.dart';
import 'package:hs/models/main_model.dart';
import 'package:hs/pagetwo.dart';
import 'package:hs/repo/connect_net.dart';
import 'package:provider/provider.dart';


class MainPage extends StatefulWidget {

//  Function wstate;
//  MainPage({
//    @required this.wstate
//});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {




  //List<int> data = [1,2,3,4];
  //동적할당,동적 사용
  //음악 어플
  //첫 -장르
  //둘  -해당노래
  //세번 -노래정보

  List<Map<String, dynamic>> data = [
    {
      "title": " 댄스",
      "src" : "",
      "data" : [
        {"title" : "댄스노래1", "name" : "가수1", "src" : "", "des" : ""},
        {"title" : "댄스노래2", "name" : "가수2", "src" : "", "des" : ""},
        {"title" : "댄스노래3", "name" : "가수3", "src" : "", "des" : ""}
  ]
    },
    {"title": " 발라드",
    "src" : "",
      "data" : [
        {"title" : "발라드노래1", "name" : "가수1", "src" : "", "des" : ""},
        {"title" : "발라드노래2", "name" : "가수2", "src" : "", "des" : ""},
        {"title" : "발라드노래3", "name" : "가수3", "src" : "", "des" : ""}
      ]
    },
  ];

  List<MainModel> result;
  ConnetNet _con =new ConnetNet();
//oop : 역할
  @override
  void initState() {

//    setState(() {
//      result =data.map((e) {
//        return new MainModel(
//            title:e["title"],
//            src: e["src"],
//            data: e["data"].map<DeepModel>((v){
//          return new DeepModel(
//            name:v["name"],
//            src: v["src"],
//            des: v["des"],
//            title: v["title"],
//          );
//        }).toList()//;시간복잡
//        );}).toList();
//    });

//    result =data.map((e) =>
//     MainModel.toJson(json: e)).toList();

 Future.microtask(()async{
   this.result =await _con.fetchGetData();
   setState(() {
   });
   return ;
 });



//    Future(()async => await _con.fetchBasic());
//    Future.microtask(() async=> await _con.fetchPostDatas());
    super.initState();
  }

  LoginCheckProvider _lc;

  @override
  Widget build(BuildContext context) {
    if(_lc == null) _lc = Provider.of<LoginCheckProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon:Icon(Icons.error_outline),
          onPressed: () async {
             await _lc.logOut();
//               SharedPreferences _pref = await SharedPreferences.getInstance();
//               await _pref.clear();
//               Navigator.of(context).pushReplacement(
////                   MaterialPageRoute(
////                     builder: (context) => LoginPage()
////                   ));
//          widget.wstate((){});
          }
          ,)
        ],
        backgroundColor: Colors.green[400],
        title: Text('메인'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: FutureBuilder(
          future: _con.fetchGetData(),
          builder: (BuildContext context, AsyncSnapshot<List<MainModel>> snap){
            if(!snap.hasData) return Container(); //setstate가 저절로 돌기때문에 리턴 사용가
            return Container(
              child: ListView.builder(
                  itemCount: snap.data.length,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                      title: Text(snap.data[index].title),
                    );
                  }),
            );
          }),
      ),
      body: this.result == null
          ? Center(child: CircularProgressIndicator(),) :
      GridView.builder(
        //갯수지정
        padding: EdgeInsets.all(10),
//        scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
      itemCount: this.result.length,
      itemBuilder:(BuildContext context, int index) {
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => new PageTwo(datas:this.result[index].data,)
            ));
          },
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
//                width: double.infinity,
                  alignment: Alignment.centerRight,
                  color: Colors.yellow,
                  child: Icon(Icons.more_horiz,
                  ),
                ),
                Container(
                  width: 60,
                    height: 60,
                  decoration: BoxDecoration(
                       borderRadius : BorderRadius.circular(60),
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://ssl.pstatic.net/tveta/libs/1282/1282755/241883b396103cf38877_20200717133534216_1.jpg',
                        ), //위젯는 안에있
                    fit: BoxFit.cover),
                    color: Colors.blue,),
//                child: Image.network(
//                    'https://ssl.pstatic.net/tveta/libs/1282/1282755/241883b396103cf38877_20200717133534216_1.jpg',
//                fit:BoxFit.cover,
//                ),//위젯위에 쌓이는
                ),
                Container(
                  child: Text(this.result[index].title,
                      style: TextStyle(
                      ),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(Icons.check),
                      Icon(Icons.clear),
                    ],
                  ),
                ),
              ],),
          ),
        );
      },
//      children : <Widget>[
//        Container(
//          color: Colors.grey,
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Container(
////                width: double.infinity,
//                alignment: Alignment.centerRight,
//                color: Colors.yellow,
//                child: Icon(Icons.more_horiz,
//                ),
//              ),
//              Container(
//                width: 60,
//                  height: 60,
//                decoration: BoxDecoration(
//                     borderRadius : BorderRadius.circular(60),
//                  image: DecorationImage(
//                      image: NetworkImage( 'https://ssl.pstatic.net/tveta/libs/1282/1282755/241883b396103cf38877_20200717133534216_1.jpg',
//                      ), //위젯는 안에있
//                  fit: BoxFit.cover),
//                  color: Colors.blue,),
//
////                child: Image.network(
////                    'https://ssl.pstatic.net/tveta/libs/1282/1282755/241883b396103cf38877_20200717133534216_1.jpg',
////                fit:BoxFit.cover,
////                ),//위젯위에 쌓이는
//              ),
//              Container(
//                child: Text('Name',
//                    style: TextStyle(
//
//                    ),
//                ),
//              ),
//              Container(
//                color: Colors.blue,
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                  children: <Widget>[
//                    Icon(Icons.check),
//                    Icon(Icons.clear),
//                  ],
//                ),
//              ),
//            ],),
//        ),
//        Container(
//          color: Colors.blue,
//        ),
//        Container(
//          color: Colors.yellow,
//        ),
//
//      ],
      ),
    );
  }
}