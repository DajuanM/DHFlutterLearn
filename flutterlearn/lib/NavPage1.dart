import 'package:flutter/material.dart';
import 'NavPage2.dart';

class NavPage1 extends StatefulWidget {
  @override
  _NavPage1State createState() => _NavPage1State();
}

class _NavPage1State extends State<NavPage1> {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(title: Text('导航页')),
        body: Center(
          child: RaisedButton(
            child: Text('下一页'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> NavPage2()
              ));
            },
          ),
        ),
      );
    }
}