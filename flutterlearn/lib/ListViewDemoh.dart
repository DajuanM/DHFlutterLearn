import 'package:flutter/material.dart';

//命名 不能有数字，结尾不能大写
class ListViewPageh extends StatefulWidget {
  @override
  _ListViewPagehState createState() => _ListViewPagehState();
}

class _ListViewPagehState extends State<ListViewPageh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Page'),
      ),
      body: Center(
        child: Container(
          height: 200.0,
          child: MyList(),
        ),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                color: Colors.red,
                width: 100,
              ),
              Container(
                color: Colors.blue,
                width: 100,
              ),
              Container(
                color: Colors.green,
                width: 100,
              ),
              Container(
                color: Colors.purple,
                width: 100,
              ),
              Container(
                color: Colors.yellow,
                width: 100,
              )
            ],
          );
    }
}
