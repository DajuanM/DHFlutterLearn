import 'package:flutter/material.dart';
import 'custom_router.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('First Page', style: TextStyle(fontSize: 36),),
        elevation: 0.0,//导航栏下阴影
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64,
          ),
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
            //   return SecondPage();
            // }));
            Navigator.of(context).push(CustomRoute(SecondPage()));
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page', style: TextStyle(fontSize: 36),),
        elevation: 4.0,
        leading: Container(),
      ),
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}