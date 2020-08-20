import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KakaoLogin extends StatefulWidget {
  @override
  _KakaoLoginState createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<KakaoLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : RaisedButton(
        child: Text('카카오로그인'),
          onPressed: () {
           Navigator.of(context).push(MaterialPageRoute(
             builder: (context) => Scaffold(
               appBar: AppBar(),
               body: WebView(
                 javascriptMode: JavascriptMode.unrestricted,
                 initialUrl: 'https://kauth.kakao.com/oauth/authorize?client_id=9e4e7c9cd07a795d88b1df4a6404b86b&redirect_uri=http://127.0.0.1:3000/auth&response_type=code',
                 //
               ),
             )
           )
           );
          },
      )
    );
  }
}
