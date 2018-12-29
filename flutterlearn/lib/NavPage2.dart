import 'package:flutter/material.dart';

class NavPage2 extends StatefulWidget {
  @override
  _NavPage2State createState() => _NavPage2State();
}

class _NavPage2State extends State<NavPage2> {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(title: Text('导航页')),
        body: Center(
          child: RaisedButton(
            child: Text('上一页'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
      );
    }
}