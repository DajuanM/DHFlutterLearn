import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}
//必须要加下划线
class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Page'),
      ),
      body: Center(
        child: Container(
          child: Image.network(
            'https://i0.hdslb.com/bfs/sycp/tmaterial/201812/42c93b99614d3bb7bd0eca6b691fca09.jpg',
            fit: BoxFit.contain,
            color: Colors.lightBlue,
            colorBlendMode: BlendMode.darken,
            repeat: ImageRepeat.repeat,
          ),
          width: 500.0,
          height: 400.0,
          color: Colors.red,
        ),
      ),
    );
  }
}
