import 'package:flutter/material.dart';

class ContanierPage extends StatefulWidget {
  @override
  _ContanierPageState createState() => _ContanierPageState();
}
//必须要加下划线
class _ContanierPageState extends State<ContanierPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Page'),
      ),
      body: Center(
        child: Container(
          child: Text(
            'this is a text',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          alignment: Alignment.center,
          width: 500.0,
          height: 400.0,
          color: Colors.lightBlue,
        ),
      ),
    );
  }
}
