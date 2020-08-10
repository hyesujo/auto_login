import 'package:flutter/material.dart';
import 'package:hs/models/deepmodel.dart';

class PageTwo extends StatefulWidget {

  List<DeepModel> datas;

  PageTwo({@required this.datas}) : assert(datas != null);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
          itemCount: widget.datas.length,
          itemBuilder: (BuildContext context,int index) {
            return ListTile(
              onTap: (){
                Text('탭');
              },
              onLongPress: (){
               Text('길게');
              },
              leading: Icon(Icons.clear),
              title: Text(widget.datas[index].name.toString()),
              subtitle: Text(widget.datas[index].title.toString()),
              trailing: IconButton(icon: Icon(Icons.backspace),
                  onPressed: (){
                    print('버튼');
                  },
              ),
            );
          }),
    );
  }
}
