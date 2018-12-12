import 'package:flutter/material.dart';

class StackWidgetPage extends StatefulWidget {
  @override
  _StackWidgetPageState createState() => _StackWidgetPageState();
}
//必须要加下划线
class _StackWidgetPageState extends State<StackWidgetPage> {
  @override
  Widget build(BuildContext context) {

    var stack = Stack(
        alignment: const FractionalOffset(0.5, 0.5),
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage('https://i0.hdslb.com/bfs/sycp/tmaterial/201812/42c93b99614d3bb7bd0eca6b691fca09.jpg'),
            radius: 100,
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Text('Aiden'),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Text('Aiden'),
          )
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.blue
          //   ),
          //   padding: EdgeInsets.all(10),
          //   child: Text('Aiden'),
          // )
        ],
      );

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Page'),
      ),
      body: stack
    );
  }
}
