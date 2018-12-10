import 'package:flutter/material.dart';

class TextPage extends StatefulWidget {
  TextPage({Key key, this.title}) : super(key: key);
  
  final String title;

  @override
  _TextPageState createState() => _TextPageState();
}
//必须要加下划线
class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
            'qweqwewqewqeqwewqewqqweqweqwewqwesdsadqeqwesadsadwasewqewewgtregterwtewrqwewqdqwerdqweqw',
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,//省略部分已...代替
            style: TextStyle(
              fontSize: 20.0,
              color: Color.fromARGB(255, 255, 0, 0),
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
            Text('this is a text')
          ],
        ),

        // child: Text(
        //   'qweqwewqewqeqwewqewqqweqweqwewqwesdsadqeqwesadsadwasewqewewgtregterwtewrqwewqdqwerdqweqw',
        //   textAlign: TextAlign.center,
        //   maxLines: 3,
        //   overflow: TextOverflow.ellipsis,//省略部分已...代替
        //   style: TextStyle(
        //     fontSize: 20.0,
        //     color: Color.fromARGB(255, 255, 0, 0),
        //     decoration: TextDecoration.underline,
        //     decorationStyle: TextDecorationStyle.solid,
        //   ),
        // ),
      ),
    );
  }
}
