import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}
//必须要加下划线
class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Page'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text('this is row1'),
          ),
          Image.network('https://i0.hdslb.com/bfs/sycp/tmaterial/201812/42c93b99614d3bb7bd0eca6b691fca09.jpg'),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('this is row2'),
          ),
          
        ],
      ),
    );
  }
}
