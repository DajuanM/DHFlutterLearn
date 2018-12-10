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
          alignment: Alignment.topLeft,
          width: 500.0,
          height: 400.0,
          // color: Colors.lightBlue, //与gradient中的colors冲突
          // padding: const EdgeInsets.all(10),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Colors.lightBlue, Colors.greenAccent, Colors.purple]
            ),
          ),
        ),
      ),
    );
  }
}
