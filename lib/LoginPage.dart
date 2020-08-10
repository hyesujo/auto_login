import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hs/Provider/LoginCheckProvider.dart';
import 'package:hs/repo/connect_net.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

//  Function wState;
//
//  LoginPage({
//    @required this.wState
//});


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _id;
  TextEditingController _pw;

  @override
  void initState() {
    _id = new TextEditingController(text : "");
    _pw = new TextEditingController(text : "");
    super.initState();
  }

  @override
  void dispose() {
    _id?.dispose();
    _pw?.dispose();
    super.dispose();
  }

  LoginCheckProvider _lc;

  @override
  Widget build(BuildContext context) {
    if(_lc == null) _lc = Provider.of<LoginCheckProvider>(context);
    return Scaffold(
      body : SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/2.0,
                  //폼 변수로
                //컨트롤러 자체가 프로바이더
                  child: TextField(
                    controller: _id,
//                  onChanged: (){} -> 변수로,
                    minLines: 1,
                    maxLength: 16,
                    maxLines: 1,//최대줄
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                       counterText: "",
                        filled: true,
                        border: InputBorder.none,
                        hintText: "Id"
                    ),
                  ),
              ),
              SizedBox(height: 30),
              Container(
                  width: MediaQuery.of(context).size.width/2.0,
                  child: TextField(
                    controller: _pw,
//                  onChanged: (){} -> 변수로,
                  minLines: 1,
                  maxLength: 16,
                  maxLines: 1,//최대줄
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: InputDecoration(
                  counterText: "",
                  filled: true,
                  border: InputBorder.none,
                  hintText: "pw"
                  ),
                  ),
              ),
              SizedBox(height: 30),
              MaterialButton(
                child: Text("Login"),
                onPressed: () async {
               await _lc.logIn(id : _id.text, pw: _pw.text);
//                  print(_id.text);
//                  ConnetNet _con = new ConnetNet();
//                bool _result = await _con.login(id : _id.text, pw : _pw.text);
//                if(_result){
//                SharedPreferences _pref =await SharedPreferences.getInstance();
//                await _pref.setBool("login", true);
//                Navigator.of(context).pushReplacement(
//                    MaterialPageRoute(
//                      builder: (BuildContext context) => new MainPage()
//                    ),
//                );
//                  widget.wState((){});
                },
                color : Colors.red,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _LoginPageState();
}
