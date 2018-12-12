import 'package:flutter/material.dart';

class ArowPage extends StatefulWidget {
  @override
  _ArowPageState createState() => _ArowPageState();
}
//必须要加下划线
class _ArowPageState extends State<ArowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Page'),
      ),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[//灵活布局跟不灵活布局
            Expanded(
              child: MaterialButton(
                color: Colors.red,
                child: Text("MaterialButton"),
              ),
            ),
            Expanded(
              child: FlatButton(
                color: Colors.red,
                child: Text("FlatButton"),
              ),
            ),
            Expanded(
              child: RaisedButton(
                onPressed: (){},
                color: Colors.red,
                child: Text("Red Button"),
              ),
            ),
            RaisedButton(
                onPressed: (){},
                color: Colors.blue,
                child: Text("Blue Button"),
              ),
            RaisedButton(
                onPressed: (){},
                color: Colors.yellow,
                child: Text("Yellow Button"),
              ),
          ],
        ),
      ),
    );
  }
}
